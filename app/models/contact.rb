class Contact < ApplicationRecord
  belongs_to :user

  validates :first_name, :last_name, :phone_number, presence: true
  validates :contact_email, presence: true, uniqueness: { scope: :user_id }

  def full_name
    "#{first_name} #{last_name}"
  end
end
