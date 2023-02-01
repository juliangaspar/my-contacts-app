class AddConstraintToContacts < ActiveRecord::Migration[7.0]
  def change
    change_column_null :contacts, :first_name, false
    change_column_null :contacts, :last_name, false
    change_column_null :contacts, :contact_email, false
    change_column_null :contacts, :phone_number, false
  end
end
