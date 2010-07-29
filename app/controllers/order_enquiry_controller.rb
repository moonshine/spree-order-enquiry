class OrderEnquiryController < ApplicationController
  def create
    @order = Order.find_for_order_enquiry(params[:order_number], params[:zipcode], params[:email])
    if @order
      session[:order_enquiry_order_id] = @order.try(:id)
      redirect_to order_enquiry_url
    else
      flash[:error] = I18n.t('order_enquiry.order_not_found')
      render :action => :new
    end
  end

  def show
    @order = Order.find_by_id(session[:order_enquiry_order_id])
    redirect_to new_order_enquiry_url and return if @order.nil?
    OrderEnquiryMailer.deliver_email_order_enquiry(@order)
    flash[:notice] = t('order_enquiry.order_enquiry_email_sent')
    redirect_to new_order_enquiry_url
  end

  def destroy
    session[:order_enquiry_order_id] = nil
    redirect_to root_url
  end
end
