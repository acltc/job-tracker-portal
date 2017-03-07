class Lead < ApplicationRecord
  belongs_to :user
  has_many :interviews, as: :interviewable, dependent: :delete_all
  has_one :invite, dependent: :delete
  has_one :connection, dependent: :delete
  has_many :emails, dependent: :delete_all
  has_one :meeting, dependent: :delete
  has_one :offer, dependent: :delete

  def last_action_friendly
    last_action.strftime("%b %e, %Y -- %l:%M%P")
  end

  def last_action_date_only
    last_action.strftime("%b %e, %Y")
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
    if offer
      return offer.name
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
