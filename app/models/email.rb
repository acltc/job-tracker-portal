class Email < ApplicationRecord
  belongs_to :lead

  def name
    return "Email Sent"
  end
end
