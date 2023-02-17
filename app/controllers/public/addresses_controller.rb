class Public::AddressesController < ApplicationController
  def index
    @customers= Customer.all
    
  end

  def edit
  end
end
