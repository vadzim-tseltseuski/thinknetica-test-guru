module BadgeIssue
  module Rule
    class Base
      def initialize(test_passage)
        @test_passage = test_passage
        @user = test_passage.user
        @test = test_passage.test
      end
    end
  end
end
