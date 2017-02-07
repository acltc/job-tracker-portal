class CreateOffers < ActiveRecord::Migration[5.0]
  def change
    create_table :offers do |t|
      t.integer :lead_id
      t.text :notes
      t.datetime :date

      t.timestamps
    end
    add_index :offers, :lead_id
  end
end
