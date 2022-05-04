# frozen_string_literal: true

class ChangeUsersColumn < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :name, :email
  end
end
