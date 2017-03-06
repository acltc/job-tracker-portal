class Submission < ApplicationRecord
  belongs_to :application

  def name
    'Submitted'
  end
end
