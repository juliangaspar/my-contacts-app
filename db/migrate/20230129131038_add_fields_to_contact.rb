class AddFieldsToContact < ActiveRecord::Migration[7.0]
  def change
    add_column :contacts, :job_title, :string
    add_column :contacts, :company, :string
  end
end
