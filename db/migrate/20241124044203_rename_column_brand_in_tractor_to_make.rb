class RenameColumnBrandInTractorToMake < ActiveRecord::Migration[7.2]
  def change
    rename_column :tractors, :brand, :make
  end
end
