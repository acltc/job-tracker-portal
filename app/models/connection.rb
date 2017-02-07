class Connection < ApplicationRecord
  belongs_to :lead

  def name
    return "LinkedIn Connection Accepted"
  end
end
