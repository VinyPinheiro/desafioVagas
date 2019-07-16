class AddEdgeToJob < ActiveRecord::Migration[5.2]
  def change
    add_reference :jobs, :edge, foreign_key: true
  end
end
