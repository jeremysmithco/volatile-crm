class User
  include ActiveModel::Model

  attr_accessor :admin

  def admin?
    admin
  end
end
