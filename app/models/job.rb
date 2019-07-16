class Job < ApplicationRecord
  belongs_to :edge
  has_many :application_for_job

  COMPANY_CANT_BLANK = 'Preencha o nome da Empresa'.freeze
  TITLE_CANT_BLANK = 'Preencha o titulo da vaga'.freeze
  DESCRIPTION_CANT_BLANK = 'Preencha a descrição da vaga'.freeze
  LOCALITY_CANT_BLANK = 'Preencha a localização da vaga'.freeze
  LEVEL_CANT_BLANK = 'Preencha o nível da vaga'.freeze
  LEVEL_IS_NUMERIC = 'Preencha o nível com um valor Inteiro e entre 1 e 5'.freeze

  validates :company, presence: { message: COMPANY_CANT_BLANK }
  validates :title, presence: { message: TITLE_CANT_BLANK }
  validates :description, presence: { message: DESCRIPTION_CANT_BLANK }
  validates :edge, presence: { message: LOCALITY_CANT_BLANK }
  validates :level, presence: { message: LEVEL_CANT_BLANK }
  validates :level, numericality: { message: LEVEL_IS_NUMERIC,
                                    only_integer: true,
                                    less_than_or_equal_to: 5,
                                    greater_than_or_equal_to: 1 }
end
