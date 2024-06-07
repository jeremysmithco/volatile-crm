class ContactCardComponent < ApplicationComponent
  with_collection_parameter :contact

  def initialize(contact:)
    @contact = contact
  end

  private

  attr_reader :contact

  class AvatarComponent < ViewComponent::Base
    def initialize(contact:)
      @contact = contact
    end

    def call
      if contact.avatar.attached? && contact.avatar.variable?
        image_tag(
          contact.avatar.variant(resize_to_fit: [200, 200]),
          class: "w-24 h-24 rounded-full",
          alt: contact.full_name
        )
      else
        tag.div(class: "w-24 h-24 rounded-full bg-cyan-600 flex justify-center items-center") do
          tag.div(contact.first_name.to_s.first.upcase, class: "text-5xl font-semibold text-cyan-200 text-center")
        end
      end
    end

    private

    attr_reader :contact
  end
end