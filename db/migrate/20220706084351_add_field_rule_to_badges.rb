class AddFieldRuleToBadges < ActiveRecord::Migration[6.1]
  def change
    add_column :badges, :badge_rule_id, :integer
  end
end
