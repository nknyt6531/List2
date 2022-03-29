class CreateShifts < ActiveRecord::Migration[5.2]
  def change
    create_table :shifts do |t|
      t.references :user, null: false, foreign_key: true
      t.date :date, null: false
      t.time :start, null: false
      t.time :finish, null: false
      t.timestamps
    end
  end
end
