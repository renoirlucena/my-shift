class RemoveAvaiableFromRequests < ActiveRecord::Migration[7.0]
  def change
    remove_column :requests, :available
  end
end
