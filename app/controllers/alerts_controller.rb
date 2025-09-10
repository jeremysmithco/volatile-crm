class AlertsController < ApplicationController
  def index
    @debug = (params[:debug] == "true")
  end
end
