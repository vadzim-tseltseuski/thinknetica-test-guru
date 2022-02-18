class User < ApplicationRecord
    def tests_by_level(level_value)
        Test.where(level: level_value)
    end
end
