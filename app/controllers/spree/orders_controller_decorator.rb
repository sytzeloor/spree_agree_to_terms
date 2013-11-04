Spree::OrdersController.class_eval do
  alias_method :original_update, :update

  def update
    if current_order && params.has_key?(:checkout) && current_order.cart? && params[:order].has_key?(:agreed_to_terms) && params[:order][:agreed_to_terms].to_i == 0
      current_order.should_validate_terms = true
      params.delete(:checkout) unless current_order.valid?
    end

    original_update
  end
end
