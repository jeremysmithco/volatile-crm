class ContactsController < ApplicationController
  def index
    @contacts = Contact.all
  end

  def show
    redirect_to [:contacts]
  end
end
