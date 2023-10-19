class CreateCriteria < ActiveRecord::Migration[6.1]
  def change
    create_table :criteria do |t|
      t.string :type
      t.string :text
      t.string :url

      t.timestamps
    end
  end
end
