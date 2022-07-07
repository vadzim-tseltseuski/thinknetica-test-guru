class BadgeIssueService

    def self.call(test_passage)
      new(test_passage).call
    end

    def initialize(test_passage)
      @test_passage = test_passage
      @user = test_passage.user
    end

    def call
      return unless @test_passage.completed?

      @user.badges.push(BadgeIssue::Checker.satisfied_badges(@test_passage))
    end
  end
