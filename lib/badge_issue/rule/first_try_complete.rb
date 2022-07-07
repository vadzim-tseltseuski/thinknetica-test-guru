module BadgeIssue
  module Rule
    class FirstTryComplete < Base
      def is_satisfied_by?(_)
        @user.tests.where(id: @test.id).count == 1
      end
    end
  end
end
