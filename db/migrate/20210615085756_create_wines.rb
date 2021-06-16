      class CreateWines < ActiveRecord::Migration[6.1]
        def change
          create_table :wines do |t|
            t.string :wine_name, null: false
            t.string :wine_name_kana
            t.integer :vintage
            t.string :wine_type, null: false
            t.text :comment
            t.text :memo
            t.integer :country_id
            t.string :state
            t.integer :purchase_price
            t.integer :selling_price
            t.integer :stock, null: false
            t.references :shop, null: false, foreign_key: true
            t.references :winary, foreign_key: true
            t.references :wholesaler, foreign_key: true
            t.references :grape, foreign_key: true
            t.boolean :onlist, default: false
            t.timestamps
          end
        end
      end
