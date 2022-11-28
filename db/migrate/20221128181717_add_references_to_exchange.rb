class AddReferencesToExchange < ActiveRecord::Migration[7.0]
  def change
    add_reference :exchanges, :user, foreign_key: true
    add_reference :exchanges, :request, foreign_key: true
  end
end
