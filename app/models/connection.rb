class Connection < ApplicationRecord
  belongs_to :lead

  def name
    'Connection'
  end
end
