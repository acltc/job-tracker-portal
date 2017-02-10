class AddExtraAttributesToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :name, :string
    add_column :users, :timezone, :string
    add_column :users, :grad_city, :string
    add_column :users, :grad_date, :date
    add_column :users, :current_city, :string
    add_column :users, :current_state, :string
  end
end
