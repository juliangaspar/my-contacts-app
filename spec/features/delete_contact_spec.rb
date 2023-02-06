require 'rails_helper'

RSpec.describe 'Delete a contact', type: :feature do
  let(:user) { FactoryBot.create(:user) }

  before do
    sign_in user
  end

  scenario "it deletes a contact" do
    contact = FactoryBot.create(:contact, user: user)
    visit contacts_path
    click_on 'Delete'
    expect(page).to have_content('Contact successfully deleted.')
    expect(page).to have_no_content(contact.contact_email)
    expect(Contact.count).to eq(0)
  end
end
