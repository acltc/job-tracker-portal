class Offer < ApplicationRecord
  belongs_to :lead

  def name
    return "Offer"
  end
end
