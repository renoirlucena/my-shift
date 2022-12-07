class RenameColumnTypeMemberships < ActiveRecord::Migration[7.0]
  def change
    rename_column :memberships, :type, :category
  end
end
