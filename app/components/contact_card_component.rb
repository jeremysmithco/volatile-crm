class ContactCardComponent < ApplicationComponent
  with_collection_parameter :contact

  renders_one :avatar, AvatarComponent

  def initialize(contact:)
    @contact = contact
  end

  def default_avatar
    AvatarComponent.new(contact: contact)
  end

  private

  attr_reader :contact

  def wrapper_classes
    "flex flex-col block bg-white shadow rounded-md p-4"
  end

  def body_classes
    "flex justify-between gap-2"
  end

  def header_classes
    "flex flex-wrap items-baseline space-x-2 text-gray-400"
  end

  def name_classes
    "text-xl font-semibold text-gray-600"
  end

  def footer_classes
    "flex gap-3 items-center pt-3 border-t-2 border-gray-100 mt-4"
  end

  def detail(icon:, field:, color: "text-gray-500")
    return unless field.present?

    tag.div(class: "flex space-x-2 items-center mt-2") do
      safe_join([
        tag.span(render("icons/#{icon}"), class: "text-gray-400"),
        tag.div(field, class: "text-sm break-all #{color}")
      ])
    end
  end

  def social(icon:, field:)
    return unless field.present?

    tag.span(render("icons/#{icon}"), class: "text-gray-400")
  end
end
