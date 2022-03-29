class CustomersController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
       redirect_to customer_path(@customer.id), notice: '登録されました。'
    else
       flash.now[:alert] = 'もう一度、確認して下さい。'
       render customer_path(1)
    end
  end

  def show
    @customer = Customer.find(params[:id])
    @comment = Comment.new
    @user = current_user
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
       redirect_to customer_path(@customer.id), notice: '更新されました。'
    else
       flash.now[:alert] = 'もう一度、確認して下さい。'
       render edit
    end
  end

  def destroy
    @customer = Customer.find(params[:id])
    if @customer.destroy
       redirect_to customer_path(@customer.id), notice: '削除されました。'
    else
       flash.now[:alert] = '削除できません。'
       render customer_path(@customer.id)
    end
  end

  private

  def customer_params
    birthday = Date.new(
      params[:customer]['birthday(1i)'].to_i,
      params[:customer]['birthday(2i)'].to_i,
      params[:customer]['birthday(3i)'].to_i)
    params.require(:customer).permit(
      :last_name, :first_name, :last_name_kana, :first_name_kana,
      :gender_id, :age, :post_code,
      :home_phone_number,:phone_number,
      :address, :list_group).merge(birthday: birthday)
  end

end
