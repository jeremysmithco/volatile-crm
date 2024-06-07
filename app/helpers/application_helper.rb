module ApplicationHelper
  def current_account
    Account.new(plan: "basic", contacts: 12, companies: 7, tasks: 21, messages: 53, features: [:search])
  end

  def current_user
    User.new(admin: true)
  end

  def contact_avatar(contact)
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
end
