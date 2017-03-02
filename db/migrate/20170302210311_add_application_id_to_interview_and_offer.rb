class AddApplicationIdToInterviewAndOffer < ActiveRecord::Migration[5.0]
  def change
    add_column :interviews, :application_id, :integer
    add_column :offers, :application_id, :integer
    add_index :interviews, :application_id
    add_index :offers, :application_id
  end
end
