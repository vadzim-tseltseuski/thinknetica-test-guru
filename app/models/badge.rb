class Badge < ApplicationRecord
  has_many :user_badges
  has_many :users, through: :user_badges
  belongs_to :badge_rule

  scope :by_rule,  ->(rule_type) { joins(:badge_rule).where(badge_rule: { rule_type: rule_type}) }

  def rule_type
    badge_rule.rule_type
  end
end
