class CommentsController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def create
    @customer = Customer.find(params[:customer_id])
    @comment = current_user.comments.new(comment_params)
    @comment.customer_id = @customer.id
    if @comment.save
       redirect_to customer_path(@customer.id), notice: '投稿されました。'
    else
       flash.now[:alert] = '投稿できません。'
       render customer_path(@customer)
    end
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:customer_id])
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
       redirect_to customer_path(@customer.id), notice: '更新されました。'
    else
       flash.now[:alert] = '更新できません。'
       render customer_path(@customer)
    end
  end

  def destroy
    @comment = Comment.find_by(id: params[:id]).destroy
    redirect_to customer_path(params[:customer_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :method, :target, :status)
  end

end
