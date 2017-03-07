class Interview < ApplicationRecord
  belongs_to :interviewable, polymorphic: true

  def name
    'Interview'
  end
end
