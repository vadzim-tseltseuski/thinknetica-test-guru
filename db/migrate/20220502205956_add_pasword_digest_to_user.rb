# frozen_string_literal: true

class AddPaswordDigestToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :password_digest, :string
  end
end
