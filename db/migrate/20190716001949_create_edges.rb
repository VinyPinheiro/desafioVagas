class CreateEdges < ActiveRecord::Migration[5.2]
  def change
    create_table :edges do |t|
      t.string :name

      t.timestamps
    end
  end
end
