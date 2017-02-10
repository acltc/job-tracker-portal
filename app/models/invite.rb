class Invite < ApplicationRecord
  belongs_to :lead

  def name
    return "Invite"
  end
end
