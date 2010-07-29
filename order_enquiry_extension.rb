# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class OrderEnquiryExtension < Spree::Extension
  version "1.0"
  description "Search for specified order and email details"
  url "http://github.com/moonshine/spree-orders-enquiry"

  def activate
    Order.send(:include, Spree::OrderEnquiry::Order)
  end
end
