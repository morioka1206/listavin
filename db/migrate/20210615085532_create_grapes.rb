class CreateGrapes < ActiveRecord::Migration[6.1]
  def change
    create_table :grapes do |t|
      t.string :grape_name
      t.timestamps
    end
  end
end
