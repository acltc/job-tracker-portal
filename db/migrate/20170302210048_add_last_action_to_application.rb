class AddLastActionToApplication < ActiveRecord::Migration[5.0]
  def change
    add_column :applications, :last_action, :datetime
  end
end
