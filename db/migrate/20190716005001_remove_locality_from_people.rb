class RemoveLocalityFromPeople < ActiveRecord::Migration[5.2]
  def change
    remove_reference :people, :locality, foreign_key: true
  end
end
