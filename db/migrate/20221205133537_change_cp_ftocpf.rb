class ChangeCpFtocpf < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :CPF, :cpf
    rename_column :users, :RE, :re
    rename_column :companies, :CNPJ, :cnpj
  end
end
