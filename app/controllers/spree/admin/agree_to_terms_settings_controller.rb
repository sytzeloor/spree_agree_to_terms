module Spree
  module Admin
    class AgreeToTermsSettingsController < Spree::Admin::BaseController
      before_filter :set_agree_to_terms_preferences

      def update
        settings = Spree::AgreeToTermsSettings.new
        @agree_to_terms_preferences.each do |preference|
          settings[preference] = params[preference]
        end

        respond_to do |format|
          format.html { redirect_to edit_admin_agree_to_terms_settings_path, success: Spree.t(:successfully_updated, scope: :agree_to_terms) }
        end
      end

      private

      def set_agree_to_terms_preferences
        @agree_to_terms_preferences = [:agree_to_terms_label, :agree_to_terms_url]
      end
    end
  end
end
