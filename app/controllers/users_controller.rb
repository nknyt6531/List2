class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def show
    @user = current_user
    @users = User.all
    beginning_of_day = Date.today.beginning_of_month
    end_of_day = Date.today.end_of_month
    user_count = @users.count.to_f
    to_month_comments = Comment.where(created_at: beginning_of_day..end_of_day)
    @working_times_all_avg = user_count.zero? ? 0 : (Shift.where(created_at: beginning_of_day..end_of_day).sum(&:working_minutes) / user_count).round(2)
    @call_counts_all_avg = user_count.zero? ? 0 : (to_month_comments.count / user_count).round(2)
    @send_counts_all_avg = user_count.zero? ? 0 : (to_month_comments.where(status: 3).count / user_count).round(2)
    @contact_counts_all_avg = user_count.zero? ? 0 : (to_month_comments.where(target: [0,1]).count / user_count).round(2)
    @call_counts_hour_all_avg = @call_counts_all_avg.zero? ? 0 : (@call_counts_all_avg / @working_times_all_avg).round(2)
    @contact_counts_hour_all_avg = @working_times_all_avg.zero? ? 0 : (@contact_counts_all_avg / @working_times_all_avg).round(2)
    @contact_counts_rate_all_avg = @call_counts_all_avg.zero? ? 0 : (@contact_counts_all_avg / @call_counts_all_avg) .round(3) * 100
    @send_counts_hour_all_avg = @send_counts_all_avg.zero? ? 0 : (@send_counts_all_avg / @working_times_all_avg).round(2)
    @send_counts_rate_all_avg = @send_counts_all_avg.zero? ? 0 : (@send_counts_all_avg / @contact_counts_all_avg).round(3) * 100
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
       redirect_to customer_path(1), notice: '更新されました。'
    else
       flash.now[:alert] = '名前の間にスペースはいらないです。emailは半角英数字で入力下さい。'
       render edit
    end
  end

  private

  def beginning_of_day
    Date.today.beginning_of_month
  end

  def end_of_day
    Date.today.end_of_month
  end

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
