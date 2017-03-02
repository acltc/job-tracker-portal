class Submission < ApplicationRecord
  belongs_to :application

  def name
    return "Submitted"
  end
end
