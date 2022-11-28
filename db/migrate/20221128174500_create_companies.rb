class CreateCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :email
      t.text :CNPJ

      t.timestamps
    end
  end
end
