class RenameColumnAvaiableToAvailable < ActiveRecord::Migration[7.0]
  def change
    rename_column :requests, :avaiable, :available
  end
end
