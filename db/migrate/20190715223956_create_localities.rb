class CreateLocalities < ActiveRecord::Migration[5.2]
  def change
    create_table :localities do |t|
      t.string :local_one
      t.string :local_two
      t.integer :distance

      t.timestamps
    end
  end
end
