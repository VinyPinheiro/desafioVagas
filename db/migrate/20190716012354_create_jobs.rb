class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.string :company
      t.string :title
      t.string :description
      t.string :level

      t.timestamps
    end
  end
end
