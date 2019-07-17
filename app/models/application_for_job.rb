class ApplicationForJob < ApplicationRecord
  belongs_to :job
  belongs_to :person

  PERSON_CANT_BLANK = 'Preencha o código da pessoa'.freeze
  JOB_CANT_BLANK = 'Preencha o código da vaga'.freeze
  EXISTENT = 'Candidatura já efetuada'.freeze

  validates :job, presence: { message: PERSON_CANT_BLANK }
  validates :person, presence: { message: JOB_CANT_BLANK }
  validates :person, uniqueness: { scope: :job, message: EXISTENT }

  def score
    experience_level = 100 - 25 * (job.level.to_i - person.level.to_i).abs
    distance = Distance.shortest_path(person.edge, job.edge)
    distance_points = if distance <= 5
                        100
                      elsif distance <= 10
                        75
                      elsif distance <= 15
                        50
                      elsif distance <= 20
                        25
                      else
                        0
                      end
    ((experience_level + distance_points) / 2).floor
  end
end
