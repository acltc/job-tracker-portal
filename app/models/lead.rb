class Lead < ApplicationRecord
  belongs_to :user
  has_many :interviews, as: :interviewable, dependent: :delete_all
  has_one :invite, dependent: :delete
  has_one :connection, dependent: :delete
  has_many :emails, dependent: :delete_all
  has_one :meeting, dependent: :delete
  has_many :offers, as: :offerable, dependent: :delete_all

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
      return offer.first.name
    elsif interviews.any?
      return interviews.first.name
    elsif meeting
      return meeting.name
    elsif emails.any?
      return emails.first.name
    elsif connection
      return connection.name
    else
      return invite.name
    end
  end
end
