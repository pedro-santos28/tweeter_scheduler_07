class Post < ApplicationRecord
  belongs_to :user

  has_rich_text :body

  validates :body, presence: true
  validates :published_at, presence: true, comparison: { greater_than: Time.current }, on: :create
end