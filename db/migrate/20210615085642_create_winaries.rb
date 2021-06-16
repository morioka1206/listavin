class CreateWinaries < ActiveRecord::Migration[6.1]
  def change
    create_table :winaries do |t|
      t.string :winary_name
      t.string :winary_name_kana
      t.timestamps
    end
  end
end
