class AddUrlToScan < ActiveRecord::Migration[6.1]
  def change
    add_column :scans, :url, :string
  end
end
