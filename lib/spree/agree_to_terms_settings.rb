module Spree
  class AgreeToTermsSettings < Preferences::Configuration
    preference :agree_to_terms_label, :string, default: 'I agree to the terms of service'
    preference :agree_to_terms_url,   :string, default: '/pages/terms'
  end
end
