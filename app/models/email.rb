class Email < ApplicationRecord
  belongs_to :lead

  def name
    return "Email"
  end
end
