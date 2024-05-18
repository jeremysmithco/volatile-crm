class Account
  include ActiveModel::Model

  attr_accessor :plan, :contacts, :companies, :tasks, :messages
end
