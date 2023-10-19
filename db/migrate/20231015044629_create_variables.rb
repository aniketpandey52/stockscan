class CreateVariables < ActiveRecord::Migration[6.1]
  def change
    create_table :variables do |t|
      t.string :type
      t.text :properties
      t.string :url
      t.string :identifier
      t.references :criterium, null: false, foreign_key: true

      t.timestamps
    end
  end
end
