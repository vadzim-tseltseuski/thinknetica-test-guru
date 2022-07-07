module BadgeIssue
  module Rule
    class LevelComplete < Base
      def is_satisfied_by?(level)
        return false if level != @test.level

        completed_level_test_ids = @user.tests.by_level(level).distinct.ids.sort
        all_level_test_ids = Test.by_level(level).ids.sort

        completed_level_test_ids == all_level_test_ids
      end
    end
  end
end
