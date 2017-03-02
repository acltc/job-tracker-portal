class CreateApplications < ActiveRecord::Migration[5.0]
  def change
    create_table :applications do |t|
      t.integer :user_id
      t.string :company
      t.string :job_title
      t.text :notes
      t.boolean :archived

      t.timestamps
    end
    add_index :applications, :user_id
  end
end
