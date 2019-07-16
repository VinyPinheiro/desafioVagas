class CreateDistances < ActiveRecord::Migration[5.2]
  def change
    create_table :distances do |t|
      t.references :src, foreign_key: { to_table: :edges }
      t.references :dst, foreign_key: { to_table: :edges }
      t.integer :length

      t.timestamps
    end
  end
end
