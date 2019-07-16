class AddEdgeToPeople < ActiveRecord::Migration[5.2]
  def change
    add_reference :people, :edge, foreign_key: true
  end
end
