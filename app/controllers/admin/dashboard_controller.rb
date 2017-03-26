class Admin::DashboardController < ApplicationController
  def index
    @unit = Unit.find(1)
  end
end
