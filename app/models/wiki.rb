class Wiki < ApplicationRecord
  belongs_to :user
  has_many :collaborators
  has_many :users, through: :collaborators

  validates :user, :title, :body, presence: true
  validates :private, inclusion: { in: [true, false] }
end
