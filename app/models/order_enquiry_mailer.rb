class OrderEnquiryMailer < ActionMailer::Base
  default_url_options[:host] = Spree::Config[:site_url]

  def email_order_enquiry(order)
    subject       "Details for Order #{order.number}}"
    from          Spree::Config[:mails_from]
    recipients    order.email
    sent_on       Time.now
    body          :order => order
  end
end
