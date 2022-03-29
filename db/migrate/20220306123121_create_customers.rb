class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :last_name, null: false
      t.string :first_name, null: false
      t.string :last_name_kana, null: false
      t.string :first_name_kana, null: false
      t.integer :gender_id, null: false
      t.date :birthday, null: false
      t.integer :age, null: false
      t.string :post_code, null: false
      t.string :home_phone_number
      t.string :phone_number
      t.string :address, null: false
      t.integer :list_group, null: false

      t.timestamps
    end
  end
end
