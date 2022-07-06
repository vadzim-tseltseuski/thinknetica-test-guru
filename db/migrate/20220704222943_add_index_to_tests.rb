class AddIndexToTests < ActiveRecord::Migration[6.1]
  def change
    def change
      add_index :tests, %i[title level], unique: true
    end
  end
end
