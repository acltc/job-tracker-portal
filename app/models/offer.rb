class Offer < ApplicationRecord
  belongs_to :lead

  def name
    'Offer'
  end
end
