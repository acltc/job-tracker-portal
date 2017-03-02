class Application < ApplicationRecord
  belongs_to :user
  has_many :interviews, dependent: :delete_all
  has_one :offer, dependent: :delete
  has_one :submission, dependent: :delete

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
    if self.offer
      return offer.name
    elsif self.interviews.any?
      return interviews.first.name
    else
      return submission.name
    end
  end
end
