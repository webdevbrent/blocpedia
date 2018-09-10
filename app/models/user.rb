class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :wikis, dependent: :destroy

  after_initialize :set_default_user_role

  enum role: [:standard, :premium, :admin]

  def set_default_user_role
    self.role ||= :standard
  end

  validates :email, presence: true

end
