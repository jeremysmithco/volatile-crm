class PageLayoutsController < ApplicationController
  def index
    @companies = Company.all
    @company = Company.first
  end
end
