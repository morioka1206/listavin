class CreateShops < ActiveRecord::Migration[6.1]
  def change
    create_table :shops do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :password_digest, null:false

      t.timestamps
    end

    add_index :shops, :email, unique: true
  end
end
