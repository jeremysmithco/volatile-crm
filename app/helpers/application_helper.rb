module ApplicationHelper
  def current_account
    Account.new(plan: "basic", contacts: 12, companies: 7, tasks: 21, messages: 53)
  end

  def current_user
    User.new(admin: true)
  end
end
