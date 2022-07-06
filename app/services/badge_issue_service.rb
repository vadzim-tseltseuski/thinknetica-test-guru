class BadgeIssueService
    def initialize(test_passage)
      @test_passage = test_passage
      @user = test_passage.user
      @test = test_passage.test
      @badges = []
    end

    def call
      return unless @test_passage.completed?

      @badges = Badge.select do |badge|
        send("#{badge.rule.downcase}?", badge.rule_option)
      end

      @user.badges.push(@badges) unless @badges.empty?
    end



    def first_try_complete?(_)
      @user.tests.where(id: @test.id).count == 1
    end

    def level_complete?(level)
      return false if level != @test.level

      completed_level_test_ids = @user.tests.by_level(level).distinct.ids.sort
      all_level_test_ids = Test.by_level(level).ids.sort

      completed_level_test_ids == all_level_test_ids
    end

    def category_complete?(category_id)
      return false if category_id != @test.category_id

      all_category_test_ids = Test.where(category_id: category_id).ids.sort
      completed_category_test_ids = @user.tests.by_category_name(category_title).ids.sort

      completed_category_test_ids == all_category_test_ids
    end
  end
