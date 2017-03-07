class AddInterviewableToInterview < ActiveRecord::Migration[5.0]
  def change
    add_column :interviews, :interviewable_type, :string
    add_column :interviews, :interviewable_id, :integer
    remove_column :interviews, :lead_id, :integer
    remove_column :interviews, :application_id, :integer    
  end
end
