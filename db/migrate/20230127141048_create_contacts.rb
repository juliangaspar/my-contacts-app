class CreateContacts < ActiveRecord::Migration[7.0]
  def change
    create_table :contacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :contact_email
      t.string :phone_number
      t.string :profile_picture
      t.string :address
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
