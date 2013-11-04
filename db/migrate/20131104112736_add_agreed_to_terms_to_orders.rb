class AddAgreedToTermsToOrders < ActiveRecord::Migration
  def up
    add_column :spree_orders, :agreed_to_terms, :boolean, default: false
    Spree::Order.update_all({ agreed_to_terms: true })
  end

  def down
    remove_column :spree_orders, :agreed_to_terms
  end
end
