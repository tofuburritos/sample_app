class CreateTables < ActiveRecord::Migration
  def change
    create_table :tables do |t|
      t.string :user
      t.string :tablename

      t.timestamps null: false
    end
  end
end
