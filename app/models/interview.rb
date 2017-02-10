class Interview < ApplicationRecord
  belongs_to :lead

  def name
    return "Interview"
  end
end
