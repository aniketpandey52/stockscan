class RenameTypeColumnInVariableToCategory < ActiveRecord::Migration[6.1]
  def change
    rename_column :variables, :type, :category
  end
end
