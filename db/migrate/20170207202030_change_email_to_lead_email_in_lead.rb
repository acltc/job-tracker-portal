class ChangeEmailToLeadEmailInLead < ActiveRecord::Migration[5.0]
  def change
    rename_column :leads, :email, :lead_email
  end
end
