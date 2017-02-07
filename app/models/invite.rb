class Invite < ApplicationRecord
  belongs_to :lead

  def name
    return "LinkedIn Invite Sent"
  end
end
