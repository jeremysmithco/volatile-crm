class AvatarComponent < ApplicationComponent
  FALLBACK_COLORS = %w[
    bg-red-600 bg-orange-600 bg-amber-600 bg-yellow-600 bg-lime-600 bg-green-600 bg-emerald-600 bg-teal-600 bg-cyan-600
    bg-sky-600 bg-blue-600 bg-indigo-600 bg-violet-600 bg-purple-600 bg-fuchsia-600 bg-pink-600 bg-rose-600
  ]

  def initialize(contact:)
    @contact = contact
  end

  def call
    if contact_avatar?
      image_tag(contact_avatar, class: "flex shrink-0 size-20 rounded-full bg-slate-300", alt: contact.full_name)
    else
      tag.div(class: "size-20 rounded-full #{fallback_color} flex shrink-0 justify-center items-center select-none") do
        tag.div(contact.first_initial, class: "text-5xl text-white text-center")
      end
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

  def fallback_color
    index = contact.full_name.codepoints.sum.modulo(FALLBACK_COLORS.size)
    FALLBACK_COLORS[index]
  end
end
