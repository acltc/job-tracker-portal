class Interview < ApplicationRecord
  belongs_to :lead

  def name
    return "Interview Set"
  end
end
