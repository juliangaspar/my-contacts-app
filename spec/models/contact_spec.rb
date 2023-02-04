require 'rails_helper'

RSpec.describe Contact, :type => :model do
  user = User.create(first_name: "Julián", last_name: "Gaspar", email: "julian@gaspar.com", password: "123456")
  subject {
    Contact.new(first_name: "Juliana",
                last_name: "García",
                phone_number: "123456789",
                contact_email: "juliana@garcia.com",
                user: user)
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a first name" do
    subject.first_name = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a last name" do
    subject.last_name = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a phone number" do
    subject.phone_number = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without an email" do
    subject.contact_email = nil
    expect(subject).to_not be_valid
  end

  it "is invalid with an invalid email format" do
    subject.contact_email = "invalid_email"
    expect(subject).to_not be_valid
  end

  it "is valid with a valid email format" do
    subject.contact_email = "example@example.com"
    expect(subject).to be_valid
  end

  it "is associated with a user" do
    expect(subject.user).to eq(user)
  end

  it "is not valid without a user" do
    subject.user = nil
    expect(subject).to_not be_valid
  end

  it "returns contact full name when combining first name and last name" do
    expect(subject.full_name).to eq("Juliana García")
  end
end
