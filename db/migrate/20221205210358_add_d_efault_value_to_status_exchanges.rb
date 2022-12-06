class AddDEfaultValueToStatusExchanges < ActiveRecord::Migration[7.0]
  def change
    change_column_default :exchanges, :status, from: nil, to: "Pendente"
  end
end
