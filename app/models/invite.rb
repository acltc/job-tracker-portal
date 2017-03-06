class Invite < ApplicationRecord
  belongs_to :lead

  def name
    'Invite'
  end
end
