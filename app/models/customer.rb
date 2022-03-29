class Customer < ApplicationRecord
  has_many :users
  has_many :comments
  
  enum gender_id: { 男: 0, 女: 1 }
  enum list_group: { １月: 0, ２月: 1, ３月: 2, ４月: 3, ５月: 4, ６月: 5,
                     ７月: 6, ８月: 7, ９月: 8, １０月: 9, １１月: 10, １２月: 11, }

end
