class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  before_action :set_customer
  
  def show
  end

  def edit
  end

  def update
    if @customer.update(customer_params)
      redirect_to my_page_path, notice: "You have update customer successfully."
    else
      render "edit"
    end
  end

  def unsubscribe
  end

  def is_deleted
    if @customer.update(customer_params)
      redirect_to root_path, notice: "You are deleted successfully."
    else
      render "unsubscribe"
    end
  end

  private

  def set_customer
    @customer = current_customer
  end

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :post_code, :address, :telephone_number, :email, :is_deleted)
  end
  
end
