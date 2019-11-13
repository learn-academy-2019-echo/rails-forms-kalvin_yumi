class BlogPost < ApplicationRecord
  has_many :comments
  validates :title, presence: true, length: {minimum:3}
  validates :content, presence: true, length: {minimum: 7}
end
