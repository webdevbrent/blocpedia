class Wiki < ApplicationRecord
  belongs_to :user

  validates :user, :title, :body, presence: true
  validates :private, inclusion: { in: [true, false] }
end
