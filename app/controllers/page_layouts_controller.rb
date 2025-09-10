class PageLayoutsController < ApplicationController
  def index
    @debug = (params[:debug] == "true")

    @companies = Company.all
    @company = Company.first
  end
end
