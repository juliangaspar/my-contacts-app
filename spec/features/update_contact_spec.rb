require 'rails_helper'

RSpec.describe 'Update a contact', type: :feature do
  let(:user) { FactoryBot.create(:user) }

  before do
    sign_in user
  end

  scenario "it updates a contact with valid inputs" do
    contact = FactoryBot.create(:contact, user: user)
    visit edit_contact_path(contact)
    fill_in 'contact_first_name', with: 'John'
    fill_in 'contact_last_name', with: 'Doe'
    fill_in 'contact_contact_email', with: 'john@doe.com'
    fill_in 'contact_phone_number', with: '987654321'
    click_on 'Submit'
    expect(page).to have_content('Contact successfully updated.')
    expect(page).to have_content('John')
    expect(page).to have_content('Doe')
    expect(page).to have_content('john@doe.com')
    expect(page).to have_content('987654321')
  end

  scenario "it doesn't update a contact with invalid inputs" do
    contact = FactoryBot.create(:contact, user: user)
    visit edit_contact_path(contact)
    fill_in 'contact_first_name', with: ''
    fill_in 'contact_last_name', with: ''
    fill_in 'contact_contact_email', with: ''
    fill_in 'contact_phone_number', with: ''
    click_on 'Submit'

    expect(page).to have_content("First name can't be blank")
    expect(page).to have_content("Last name can't be blank")
    expect(page).to have_content("Contact email can't be blank")
    expect(page).to have_content("Phone number can't be blank")
  end
end
