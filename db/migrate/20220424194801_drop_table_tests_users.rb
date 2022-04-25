# frozen_string_literal: true

class DropTableTestsUsers < ActiveRecord::Migration[6.1]
  def up
    drop_table :test_users, if_exists: true
  end

  def down; end
end
