class RenameAddresColumnToAddress < ActiveRecord::Migration[6.1]
  def change
    rename_column :addresses, :address, :location
  end
end
