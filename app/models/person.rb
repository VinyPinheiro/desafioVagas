class Person < ApplicationRecord
  belongs_to :edge
  has_many :application_for_job

  NAME_CANT_BLANK = 'Preencha o nome da pessoa'.freeze
  OCCUPATION_CANT_BLANK = 'Preencha a profissão da pessoa'.freeze
  LOCALITY_CANT_BLANK = 'Preencha a localização da pessoa'.freeze
  LEVEL_CANT_BLANK = 'Preencha o nível da pessoa'.freeze
  LEVEL_IS_NUMERIC = 'Preencha o nível com um valor Inteiro e entre 1 e 5'.freeze

  validates :name, presence: { message: NAME_CANT_BLANK }
  validates :occupation, presence: { message: OCCUPATION_CANT_BLANK }
  validates :edge, presence: { message: LOCALITY_CANT_BLANK }
  validates :level, presence: { message: LEVEL_CANT_BLANK }
  validates :level, numericality: { message: LEVEL_IS_NUMERIC,
                                    only_integer: true,
                                    less_than_or_equal_to: 5,
                                    greater_than_or_equal_to: 1 }
end
