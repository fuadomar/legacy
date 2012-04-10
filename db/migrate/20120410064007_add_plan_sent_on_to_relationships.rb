class AddPlanSentOnToRelationships < ActiveRecord::Migration
  def self.up
    add_column :relationships, :plan_sent_on, :date
  end

  def self.down
    remove_column :relationships, :plan_sent_on
  end
end
