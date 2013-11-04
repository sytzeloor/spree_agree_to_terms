Spree::Core::Engine.routes.draw do
  namespace :admin do
    resource :agree_to_terms_settings, only: [:edit, :update]
  end
end
