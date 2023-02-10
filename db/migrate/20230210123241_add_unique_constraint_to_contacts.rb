class AddUniqueConstraintToContacts < ActiveRecord::Migration[7.0]
  def change
    add_index :contacts, [:contact_email, :user_id], unique: true
  end
end
