class Email < ApplicationRecord
  belongs_to :lead

  def name
    'Email'
  end
end
