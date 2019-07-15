class Locality < ApplicationRecord
  LOCAL_ONE_CANT_BLANK = 'Preencha o primeiro nó'.freeze
  LOCAL_TWO_CANT_BLANK = 'Preencha o segundo nó'.freeze
  DISTANCE_CANT_BLANK = 'Preencha a distância'.freeze
  DISTANCE_IS_NUMERIC = 'Preencha a distância com um valor Inteiro'.freeze

  validates :local_one, presence: { message: LOCAL_ONE_CANT_BLANK }
  validates :local_two, presence: { message: LOCAL_TWO_CANT_BLANK }
  validates :distance, presence: { message: DISTANCE_CANT_BLANK }
  validates :distance, numericality: { message: DISTANCE_IS_NUMERIC,
                                       only_integer: true }
end
