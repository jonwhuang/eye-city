class CreateReturns < ActiveRecord::Migration
  def change
    create_table :returns do |t|
      t.string :auth_number, null: false
      t.date :return_date, null: false
      t.date :credit_date
      t.string :credit_memo_number
      t.integer :brand_id, null: false
      t.integer :manufacturer_id, null: false
      t.integer :frame_count, null: false
      t.string :comments

      t.timestamps null: false
    end
  end
end
