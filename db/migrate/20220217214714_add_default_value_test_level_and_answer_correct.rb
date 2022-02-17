class AddDefaultValueTestLevelAndAnswerCorrect < ActiveRecord::Migration[6.1]
  def change
    change_column :tests, :level, :type, default: 1
    change_column :answers, :correct, :type, default: false
  end
end
