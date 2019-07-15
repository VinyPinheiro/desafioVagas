class CreatePeople < ActiveRecord::Migration[5.2]
  def change
    create_table :people do |t|
      t.string :name
      t.string :occupation
      t.references :locality, foreign_key: true
      t.integer :level

      t.timestamps
    end
  end
end
