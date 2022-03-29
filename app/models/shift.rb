class Shift < ApplicationRecord
  belongs_to :user

  def start_time
    DateTime.parse(self.date.strftime('%Y-%m-%d') +'T'+ self.start.strftime('%R'))
  end

  def working_minutes
    (finish - start) / 3600
  end

end
