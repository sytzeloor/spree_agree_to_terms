Deface::Override.new(
  virtual_path: 'spree/orders/edit',
  name: 'terms_checkbox_for_checkout',
  insert_after: '#subtotal[data-hook]',
  partial: 'spree/agree_to_terms/checkbox',
  disabled: false
)
