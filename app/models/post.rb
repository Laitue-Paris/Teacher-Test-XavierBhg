class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy

  scope :sort_by_new, -> { order(vote_count: :desc) }

  def user_voted?(user)
    votes.exists?(user: user)
  end

  def time_ago
    time_diff = Time.current - created_at
    hours = (time_diff / 1.hour).round
    if hours < 1
      "Just now"
    elsif hours < 24
      "#{hours} #{'hour'.pluralize(hours)} ago"
    else
      days = (hours / 24).round
      "#{days} #{'day'.pluralize(days)} ago"
    end
  end
end
