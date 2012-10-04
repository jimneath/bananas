class CreateBananas < ActiveRecord::Migration
  def change
    create_table :bananas do |t|
      t.string :name
      t.string :colour
      t.integer :length

      t.timestamps
    end
  end
end
