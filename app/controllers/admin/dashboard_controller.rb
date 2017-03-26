class Admin::DashboardController < ApplicationController
  def index
    @building = Buildings.new
  end
end
