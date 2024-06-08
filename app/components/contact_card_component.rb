class ContactCardComponent < ApplicationComponent
  with_collection_parameter :contact

  def initialize(contact:)
    @contact = contact
  end

  private

  attr_reader :contact

  class AvatarComponent < ApplicationComponent
    def initialize(contact:)
      @contact = contact
    end

    def call
      if contact_avatar?
        image_tag(contact_avatar, class: image_classes, alt: contact.full_name)
      else
        tag.div(tag.div(contact.first_initial, class: fallback_classes), class: wrapper_classes)
      end
    end

    private

    attr_reader :contact

    def contact_avatar?
      contact.avatar.attached? && contact.avatar.variable?
    end

    def contact_avatar
      contact.avatar.variant(resize_to_fit: [200, 200])
    end

    def image_classes
      "w-20 h-20 rounded-full"
    end

    def wrapper_classes
      "w-20 h-20 rounded-full bg-cyan-700 flex justify-center items-center"
    end

    def fallback_classes
      "text-5xl font-semibold text-cyan-100 text-center"
    end
  end
end
