class ContactsController < ApplicationController
  before_action :set_contact, only: %i[show edit update destroy versions]

  def index
    @contacts = current_user.contacts.order(first_name: :asc, last_name: :asc)
  end

  def show
  end

  def new
    @contact = Contact.new
    @user = current_user
  end

  def create
    @contact = current_user.contacts.new(contact_params)
    if @contact.save
      redirect_to contacts_path, notice: "Contact successfully created."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @contact.update(contact_params)
      redirect_to contacts_path, notice: "Contact successfully updated."
    else
      render 'edit'
    end
  end

  def destroy
    @contact.destroy
    redirect_to contacts_url, notice: "Successfully destroyed contact."
  end

  def versions
    @contacts = @contact.versions
  end

  private

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :contact_email, :phone_number, :job_title, :company)
  end

  def set_contact
    @contact = Contact.find(params[:id])
  end
end
