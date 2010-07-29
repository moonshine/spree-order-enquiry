module Spree::OrderEnquiry::Order

  def self.included(target)
    target.class_eval do
      def self.find_for_order_enquiry(number=nil, zipcode=nil, email=nil)
        return nil if number.blank? || zipcode.blank? || email.blank?
        find_by_number(number, :include => [:ship_address, :checkout],
          :conditions => ["addresses.zipcode = ? AND checkouts.email = ?", zipcode, email])
      end
    end
  end

end
