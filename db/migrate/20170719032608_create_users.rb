class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :password_digest
      t.string :password_confirm
      t.string :key
      t.string :user_beiwanglu

      t.timestamps
    end
  end
end
