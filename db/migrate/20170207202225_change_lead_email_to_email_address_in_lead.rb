class ChangeLeadEmailToEmailAddressInLead < ActiveRecord::Migration[5.0]
  def change
    rename_column :leads, :lead_email, :email_address
  end
end
