class RenameNumberColumnToDelis < ActiveRecord::Migration[6.0]
  def change
    rename_column :delis, :number, :banchi
  end
end
