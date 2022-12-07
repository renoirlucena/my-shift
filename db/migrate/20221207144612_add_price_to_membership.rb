class AddPriceToMembership < ActiveRecord::Migration[7.0]
  def change
    add_monetize :memberships, :price, currency: { present: false }
  end
end
