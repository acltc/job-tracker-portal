class Meeting < ApplicationRecord
  belongs_to :lead

  def name
    return "Meeting"
  end
end
