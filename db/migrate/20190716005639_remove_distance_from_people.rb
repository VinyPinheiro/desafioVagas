class RemoveDistanceFromPeople < ActiveRecord::Migration[5.2]
  def change
    remove_reference :people, :distance, foreign_key: true
  end
end
