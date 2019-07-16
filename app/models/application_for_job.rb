class ApplicationForJob < ApplicationRecord
  belongs_to :job
  belongs_to :person

  PERSON_CANT_BLANK = 'Preencha o código da pessoa'.freeze
  JOB_CANT_BLANK = 'Preencha o código da vaga'.freeze
  EXISTENT = 'Candidatura já efetuada'

  validates :job, presence: { message: PERSON_CANT_BLANK }
  validates :person, presence: { message: JOB_CANT_BLANK }
  validates :person, uniqueness: { scope: :job, message: EXISTENT }
end
