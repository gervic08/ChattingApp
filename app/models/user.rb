# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  has_many :messages, dependent: :destroy

  validates :username, presence: true,
                       uniqueness: { case_sensitive: false },
                       length: { minimum: 3, maximum: 20 }
end
