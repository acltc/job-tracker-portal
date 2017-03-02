class ChangeAllDatetimesToDates < ActiveRecord::Migration[5.0]
  def change
    change_column :leads, :last_action, :date
    change_column :applications, :last_action, :date
    change_column :submissions, :date, :date
    change_column :invites, :date, :date
    change_column :connections, :date, :date
    change_column :meetings, :date, :date
    change_column :interviews, :date, :date
    change_column :offers, :date, :date
  end
end
