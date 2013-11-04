Deface::Override.new(
  virtual_path: "spree/admin/shared/_configuration_menu",
  name: "agree_to_terms_settings_tab",
  insert_bottom: "[data-hook='admin_configurations_sidebar_menu'], #admin_configurations_sidebar_menu[data-hook]",
  text: "<%= configurations_sidebar_menu_item Spree.t(:settings_tab, scope: :agree_to_terms), edit_admin_agree_to_terms_settings_path %>",
  disabled: false
)
