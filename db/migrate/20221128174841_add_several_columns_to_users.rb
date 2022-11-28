class AddSeveralColumnsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :CPF, :text
    add_column :users, :RE, :text
    add_column :users, :phone, :text
  end
end
