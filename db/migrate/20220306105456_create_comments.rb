class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      #t.references :user, null: false, foreign_key: true
      #t.references :customer, null: false, foreign_key: true
      t.integer :user_id
      t.integer :customer_id
      t.text :comment
      t.integer :method, null: false
      t.integer :target, null: false
      t.integer :status, null: false
      t.date :next_date
      t.time :next_time
      t.string :sender
      t.integer :rank
      
      t.timestamps
    end
  end
end
