class AddOfferableAttributesToOffer < ActiveRecord::Migration[5.0]
  def change
    add_column :offers, :offerable_type, :string
    add_column :offers, :offerable_id, :integer
    remove_column :offers, :lead_id, :integer
    remove_column :offers, :application_id, :integer 
  end
end
