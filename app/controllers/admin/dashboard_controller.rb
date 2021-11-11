class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['USERNAME'].to_s, password: ENV['PASSWORD'].to_s
  def show
    @total_products = Product.count 
    @total_categories = Category.count
  end
end
