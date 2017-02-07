class CreateInterviews < ActiveRecord::Migration[5.0]
  def change
    create_table :interviews do |t|
      t.integer :lead_id
      t.text :notes
      t.datetime :date

      t.timestamps
    end
    add_index :interviews, :lead_id
  end
end
