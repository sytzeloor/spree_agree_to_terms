module Spree
  module Admin
    class AgreeToTermsSettingsController < Spree::Admin::BaseController
      def edit
        @agree_to_terms_preferences = [:agree_to_terms_label, :agree_to_terms_url]
      end

      def update
        Spree::Config.set(params[:preferences])

        respond_to do |format|
          format.html { redirect_to edit_admin_agree_to_terms_settings_path }
        end
      end
    end
  end
end
