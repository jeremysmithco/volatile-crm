class ContactsController < ApplicationController
  def index
    @contacts = Contact.all
  end
end
