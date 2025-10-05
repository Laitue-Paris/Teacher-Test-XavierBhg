class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :reacts, dependent: :destroy
  # validates :content, presence: true

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
