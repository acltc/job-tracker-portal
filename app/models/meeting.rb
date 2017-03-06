class Meeting < ApplicationRecord
  belongs_to :lead

  def name
    'Meeting'
  end
end
