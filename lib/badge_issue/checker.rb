class BadgeIssue::Checker
  def self.satisfied_badges(test_passage)
    new.satisfied_badges(test_passage)
  end

  private

  def satisfied_badges(test_passage)
    @badges = Badge.select do |badge|
      is_satisfied?(badge)
    end
  end

  def is_satisfied?(badge)
    rule_class = "badge_issue/rule/#{badge.rule.downcase}".camelize.constantize
    rule_class.new(test_passage).is_satisfied_by?(badge.rule_option)
  end
end
