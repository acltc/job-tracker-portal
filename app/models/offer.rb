class Offer < ApplicationRecord
  belongs_to :lead

  def name
    return "Job Offer Made"
  end
end
