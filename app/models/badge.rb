# frozen_string_literal: true

class Badge < ApplicationRecord
  RULE = %w(first_try_complete level_complete category_complete).freeze

  has_many :user_badges
  has_many :users, through: :user_badges

  validates :title, :image_url, :rule, presence: true
end
