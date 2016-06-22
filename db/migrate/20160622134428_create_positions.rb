class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.string :tablename
      t.string :posname
      t.integer :count
      t.string :countype
      t.float :price
      t.float :total

      t.timestamps null: false
    end
  end
end
