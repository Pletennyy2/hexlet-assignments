class PostComment < ApplicationRecord
  belongs_to :presenceost
  validates :body, presence: true
end
