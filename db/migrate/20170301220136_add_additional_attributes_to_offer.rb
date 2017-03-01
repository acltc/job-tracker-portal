class AddAdditionalAttributesToOffer < ActiveRecord::Migration[5.0]
  def change
    add_column :offers, :status, :string
    add_column :offers, :job_title, :string
    add_column :offers, :company_name, :string
    add_column :offers, :location, :string
    add_column :offers, :starting_salary, :string
    add_column :offers, :first_date, :date
  end
end
