class CreateSubmissions < ActiveRecord::Migration[5.0]
  def change
    create_table :submissions do |t|
      t.integer :application_id
      t.text :notes
      t.datetime :date

      t.timestamps
    end
    add_index :submissions, :application_id
  end
end
