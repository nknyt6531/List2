class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :customer

  enum method: { OUT1: 0, OUT2: 1, IN: 3 }
  enum target: { 本人: 0, 決済者: 1, 配偶者: 2, 家族: 3, その他: 4 }
  enum status: { 留守: 0, 再コール: 1, NG: 2, 新規発送: 3 }
  enum rank: { A: 0, B: 1, C: 2, D: 3, E: 4, F: 5 }
end
