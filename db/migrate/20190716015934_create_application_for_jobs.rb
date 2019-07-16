class CreateApplicationForJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :application_for_jobs do |t|
      t.references :job, foreign_key: true
      t.references :person, foreign_key: true

      t.timestamps
    end
  end
end
