class Account
  include ActiveModel::Model

  attr_accessor :plan, :contacts, :companies, :tasks, :messages, :features

  def enabled_feature?(feature)
    feature.in?(features)
  end
end
