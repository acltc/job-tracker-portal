class Lead < ApplicationRecord
  has_many :interviews
  has_one :invite
  has_one :connection
  has_one :email
  has_one :meeting
  has_one :offer
end
