class Offer < ApplicationRecord
  belongs_to :offerable, polymorphic: true

  def name
    'Offer'
  end
end
