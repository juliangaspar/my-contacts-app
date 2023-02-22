class Contact < ApplicationRecord
  belongs_to :user
  has_paper_trail

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze

  validates :first_name, :last_name, :phone_number, presence: true
  validates :contact_email, presence: true, uniqueness: { scope: :user_id }, format: { with: EMAIL_REGEX }

  def full_name
    "#{first_name} #{last_name}"
  end

  include PgSearch::Model
  pg_search_scope :search_by_contact,
    against: %i[first_name last_name contact_email phone_number job_title company],
    using: {
      tsearch: { prefix: true }
    }
end
