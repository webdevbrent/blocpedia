class Collaborator < ApplicationRecord
  belongs_to :wiki
  belongs_to :user

  validate :not_owned

  private

    def not_owned
      return unless user = wiki.user
    end

end
