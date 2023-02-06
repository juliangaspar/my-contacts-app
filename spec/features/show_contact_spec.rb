require 'rails_helper'

RSpec.describe 'Show a contact', type: :feature do
  let(:user) { FactoryBot.create(:user) }

  before do
    sign_in user
  end

  scenario "it displays a contact" do
    contact = FactoryBot.create(:contact, user: user)
    visit contacts_path
    expect(page).to have_content(contact.first_name)
    expect(page).to have_content(contact.last_name)
    expect(page).to have_content(contact.phone_number)
    expect(page).to have_content(contact.contact_email)
  end
end
