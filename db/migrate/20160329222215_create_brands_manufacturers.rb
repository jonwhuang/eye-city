class CreateBrandsManufacturers < ActiveRecord::Migration
  def change
    create_table :brands_manufacturers do |t|
      t.integer :brand_id
      t.integer :manufacturer_id
    end
  end
end
