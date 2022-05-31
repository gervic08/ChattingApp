# frozen_string_literal: true

class Message < ApplicationRecord
  belongs_to :user

  validates :words, presence: true,
                    length: { minimum: 1, maximum: 200 }
  validates :user_id, presence: true
  scope :last_20, -> { order(:created_at).last(20) }
end
