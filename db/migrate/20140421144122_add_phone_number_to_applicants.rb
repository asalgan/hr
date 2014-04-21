class AddPhoneNumberToApplicants < ActiveRecord::Migration
  def change
    add_column :applicants, :phone_number, :string
    add_column :applicants, :email_address, :string
  end
end
