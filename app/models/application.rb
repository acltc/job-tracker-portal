class Application < ApplicationRecord
  belongs_to :user
  has_many :interviews, as: :interviewable, dependent: :delete_all
  has_many :offers, as: :offerable, dependent: :delete_all
  has_one :submission, dependent: :delete

  def last_action_friendly
    last_action
  end

  def last_action_date_only
    last_action
  end

  def notes_preview
    preview_max_length = 40
    if notes.length > preview_max_length
      return notes.truncate(preview_max_length, separator: ' ')
    else
      return notes
    end
  end

  def current_step
    if offers.any?
      return offers.first.name
    elsif interviews.any?
      return interviews.first.name
    else
      return submission.name
    end
  end
end
