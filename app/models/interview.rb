class Interview < ApplicationRecord
  belongs_to :lead

  def name
    'Interview'
  end
end
