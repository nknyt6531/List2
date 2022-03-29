class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :customers
  has_many :comments
  has_many :shifts

  def beginning_of_day
    Date.today.beginning_of_month
  end

  def end_of_day
    Date.today.end_of_month
  end

  def this_month
    beginning_of_day..end_of_day
  end

  def working_time
    shifts.where(date: this_month).sum(&:working_minutes).to_f
  end

  def call_counts
    comments.where(created_at: this_month).count.to_f
  end

  def send_counts
    comments.where(status: 3, created_at: this_month).count.to_f
  end

  def contact_counts
    comments.where(target: [0,1], created_at: this_month).count.to_f
  end

  def call_count_hour
    if working_time == 0
       0
    else
       (call_counts / working_time).round(2)
    end
  end

  def contact_count_hour
    if working_time == 0
       0
    else
       (contact_counts / working_time).round(2)
    end
  end

  def contact_count_rate
    if contact_counts == 0
       0
    else
       (contact_counts / call_counts * 100).round(1)
    end
  end

  def send_count_hour
    if working_time == 0
       0
    else
       (send_counts / working_time).round(2)
    end
  end

  def send_count_rate
    if contact_counts == 0
       0
    else
       (send_counts / contact_counts * 100).round(1)
    end
  end

end
