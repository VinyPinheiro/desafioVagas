class Distance < ApplicationRecord
  belongs_to :src, class_name: 'Edge'
  belongs_to :dst, class_name: 'Edge'

  LOCAL_ONE_CANT_BLANK = 'Preencha o primeiro nó'.freeze
  LOCAL_TWO_CANT_BLANK = 'Preencha o segundo nó'.freeze
  DISTANCE_CANT_BLANK = 'Preencha a distância'.freeze
  DISTANCE_IS_NUMERIC = 'Preencha a distância com um valor Inteiro'.freeze

  validates :src, presence: { message: LOCAL_ONE_CANT_BLANK }
  validates :dst, presence: { message: LOCAL_TWO_CANT_BLANK }
  validates :length, presence: { message: DISTANCE_CANT_BLANK }
  validates :length, numericality: { message: DISTANCE_IS_NUMERIC,
                                     only_integer: true }
end
