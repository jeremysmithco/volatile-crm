class ContactCardComponent < ApplicationComponent
  with_collection_parameter :contact

  def initialize(contact:)
    @contact = contact
  end

  private

  attr_reader :contact
end
