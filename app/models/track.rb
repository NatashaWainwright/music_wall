class Track < ActiveRecord::Base
  belongs_to :account
  has_many :votes
  validates :title, presence: true
  validates :author, presence: true
  validates :account_id, presence: true
end