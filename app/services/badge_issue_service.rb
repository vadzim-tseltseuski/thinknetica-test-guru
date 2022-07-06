class BadgeIssueService
    def initialize(test_passage)
      @test_passage = test_passage
      @user = test_passage.user
      @test = test_passage.test
    end

    def call
      if @test_passage.completed?
        first_try_complete
        level_complete
        category_complete
      end
    end

    private

    def issue_badge(*badge)
      @user.badges << badge
    end

    def first_try_complete
      @user.tests.where(id: @test.id).count == 1
      issue_badge(Badge.by_rule('first_try_complete'))
    end

    def level_complete
      level = @test.level
      completed_level_test_ids = @user.tests.by_level(level).distinct.ids.sort
      all_level_test_ids = Test.by_level(level).ids.sort

      if completed_level_test_ids == all_level_test_ids
        issue_badge(Badge.by_rule('level_complete'))
      end
    end

    def category_complete
      category_title = @test.category.title
      all_category_test_ids = Test.by_category_name(category_title).ids.sort
      completed_category_test_ids = @user.tests.by_category_name(category_title).ids.sort

      if completed_category_test_ids == all_category_test_ids
        issue_badge(Badge.by_rule('category_complete'))
      end
    end
  end
