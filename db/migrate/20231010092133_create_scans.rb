class CreateScans < ActiveRecord::Migration[6.1]
  def change
    create_table :scans do |t|
      t.string :name
      t.string :tag
      t.string :color

      t.timestamps
    end
  end
end
