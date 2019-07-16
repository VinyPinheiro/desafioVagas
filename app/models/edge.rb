class Edge < ApplicationRecord
  has_many :distance, foreign_key: 'src_id'
  has_many :distance, foreign_key: 'dst_id'

  NAME_CANT_BLANK = 'Preencha o nó'.freeze
  NAME_IS_UNIQUE = 'Nó ja existente'.freeze

  validates :name, presence: { message: NAME_CANT_BLANK }
  validates :name, uniqueness: { message: NAME_IS_UNIQUE }
end
