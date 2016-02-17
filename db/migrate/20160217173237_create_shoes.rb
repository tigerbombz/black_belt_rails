class CreateShoes < ActiveRecord::Migration
  def change
    create_table :shoes do |t|
      t.string :product
      t.string :seller
      t.float :amount

      t.timestamps null: false
    end
  end
end
