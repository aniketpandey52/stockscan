class RenameTypeColumnInCriteriaToCategory < ActiveRecord::Migration[6.1]
  def change
    rename_column :criteria, :type, :category
  end
end
