class AddDefaultToArchivedInLead < ActiveRecord::Migration[5.0]
  def up
    change_column :leads, :archived, :boolean, default: false
  end

  def down
    change_column :leads, :archived, :boolean, default: nil
  end
end
