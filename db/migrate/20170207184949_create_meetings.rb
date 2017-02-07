class CreateMeetings < ActiveRecord::Migration[5.0]
  def change
    create_table :meetings do |t|
      t.integer :lead_id
      t.text :notes
      t.datetime :date

      t.timestamps
    end
    add_index :meetings, :lead_id
  end
end
