require 'spree_agree_to_terms/version'

module SpreeAgreeToTerms
  class Engine < Rails::Engine
    require 'spree/core'
    isolate_namespace Spree
    engine_name 'spree_agree_to_terms'

    config.autoload_paths += %W(#{config.root}/lib)

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end

    initializer 'spree.agree_to_terms.environment', before: :load_config_initializers do |app|
      Spree::AgreeToTerms::Config = Spree::AgreeToTermsSettings.new
    end

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), '../../app/**/*_decorator*.rb')) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end

      Spree::PermittedAttributes.checkout_attributes.push(:agreed_to_terms)
    end

    config.to_prepare &method(:activate).to_proc
  end
end
