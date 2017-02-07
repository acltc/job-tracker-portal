class CreateEmails < ActiveRecord::Migration[5.0]
  def change
    create_table :emails do |t|
      t.integer :lead_id
      t.text :notes
      t.datetime :date

      t.timestamps
    end
    add_index :emails, :lead_id
  end
end
