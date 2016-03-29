class CreateReturns < ActiveRecord::Migration
  def change
    create_table :returns do |t|
      t.string :auth_number
      t.date :return_date
      t.date :paid_date
      t.string :credit_memo_number
      t.integer :brand_id
      t.integer :frame_count
      t.string :comments

      t.timestamps null: false
    end
  end
end
