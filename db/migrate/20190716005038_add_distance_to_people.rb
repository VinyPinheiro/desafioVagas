class AddDistanceToPeople < ActiveRecord::Migration[5.2]
  def change
    add_reference :people, :distance, foreign_key: true
  end
end
