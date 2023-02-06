require 'rails_helper'

RSpec.describe 'Create a contact', type: :feature do
  let(:user) { FactoryBot.create(:user) }

  before do
    sign_in user
  end

  scenario "it creates a contact with valid inputs" do
    visit new_contact_path
    fill_in 'contact_first_name', with: 'Julián'
    fill_in 'contact_last_name', with: 'Gaspar'
    fill_in 'contact_contact_email', with: 'julian@gaspar.com'
    fill_in 'contact_phone_number', with: '123456789'
    click_on 'Submit'
    expect(page).to have_content('Contact successfully created.')
    visit contacts_path
    expect(page).to have_content('Julián')
    expect(page).to have_content('Gaspar')
    expect(page).to have_content('julian@gaspar.com')
    expect(page).to have_content('123456789')
  end

  scenario "it doesn't create contact with invalid inputs" do
    visit new_contact_path
    fill_in 'contact_first_name', with: ''
    fill_in 'contact_last_name', with: ''
    fill_in 'contact_contact_email', with: ''
    fill_in 'contact_phone_number', with: ''
    click_on 'Submit'

    expect(page).to have_content("First name can't be blank")
    expect(page).to have_content("Last name can't be blank")
    expect(page).to have_content("Contact email can't be blank")
    expect(page).to have_content("Phone number can't be blank")
    expect(Contact.count).to eq(0)
  end
end
