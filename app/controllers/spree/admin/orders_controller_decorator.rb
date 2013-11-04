Spree::Admin::OrdersController.class_eval do
  def new
    @order = Spree::Order.create(agreed_to_terms: true)
    @order.created_by = try_spree_current_user
    @order.save
    redirect_to edit_admin_order_url(@order)
  end
end
