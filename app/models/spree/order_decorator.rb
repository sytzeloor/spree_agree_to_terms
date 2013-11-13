Spree::Order.class_eval do
  attr_accessible :agreed_to_terms
  attr_accessor :should_validate_terms

  validates :agreed_to_terms, acceptance: true, if: Proc.new { |order| order.send(:require_email) || order.should_validate_terms }

  def agreed_to_terms
    read_attribute(:agreed_to_terms) == true ? '1' : '0'
  end
end
