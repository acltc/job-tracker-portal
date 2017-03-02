class ChangeDateToDatetimeInEmail < ActiveRecord::Migration[5.0]
  def change
    change_column :emails, :date, :date
  end
end
