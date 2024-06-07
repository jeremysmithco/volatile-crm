class Contact < ApplicationRecord
  belongs_to :company

  has_one_attached :avatar

  def full_name
    [first_name, last_name].compact.join(" ")
  end

  def social?
    [linkedin, github, twitter].compact_blank.any?
  end
end
