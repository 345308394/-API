class CreateWzxes < ActiveRecord::Migration[5.1]
  def change
    create_table :wzxes do |t|
      t.string :name
      t.string :information
      t.string :food
      t.string :tuijian
      t.column :pt, :point

      t.timestamps
    end
  end
end
