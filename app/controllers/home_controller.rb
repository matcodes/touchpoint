class HomeController < ApplicationController

  IMAGE_NAME='diesel_box'
  #IMAGE_NAME='wine_box'
  #IMAGE_NAME='lv'
  #IMAGE_NAME='apple_box'
  
  before_filter :authenticate_user!, :except => [:index1, :index2, :index3, :index4]
  def index
  end

  def send_quotation
    products = params[:products].split(",")
    CartMailer.quotation(current_user, products).deliver
    render :text => "success"
  end

  def index1
    render :action => 'index1', :layout => false
  end
  
  def index2  #reg image
    render :action => 'index2', :layout => false
  end

  def index3 #hi res image
    render :action => 'index3', :layout => false
  end

  def index4 #hi res image
    render :action => 'index4', :layout => false
  end
end
