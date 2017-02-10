class Connection < ApplicationRecord
  belongs_to :lead

  def name
    return "Connection"
  end
end
