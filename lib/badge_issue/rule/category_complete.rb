module BadgeIssue
  module Rule
    class CategoryComplete < Base
      def is_satisfied_by?(category_id)
        return false if category_id != @test.category_id

        all_category_test_ids = Test.where(category_id: category_id).ids.sort
        completed_category_test_ids = @user.tests.where(category_id: category_id).distinct.ids.sort

        completed_category_test_ids == all_category_test_ids
      end
    end
  end
end
