class CreateInvites < ActiveRecord::Migration[5.0]
  def change
    create_table :invites do |t|
      t.integer :lead_id
      t.text :notes
      t.datetime :date

      t.timestamps
    end
    add_index :invites, :lead_id
  end
end
