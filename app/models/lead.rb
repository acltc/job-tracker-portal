class Lead < ApplicationRecord
  has_many :interviews
  has_one :invite, :connection, :email, :meeting, :offer
end
