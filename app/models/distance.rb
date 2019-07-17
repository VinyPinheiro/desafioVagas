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

  class << self
    def shortest_path(edge_src, edge_dst)
      calculate(edge_src, edge_dst)
      @distances[edge_dst.name]
    end

    private

    def calculate(src, dst)
      @distances = {}
      return @distances[dst.name] = 0 if src == dst

      visited = {}
      Distance.all.each do |vertex|
        @distances[vertex.src.name] = Float::INFINITY # Infinity
        visited[vertex.src.name] = false
      end
      @distances[src.name] = 0
      visited[src.name] = true
      paths(dst, Distance.where(src: src), visited)
      @distances
    end

    def paths(dst, connecteds, visited)
      return if connecteds.nil?

      connecteds.each do |vertex|
        next if visited[vertex.dst.name]

        if @distances[vertex.dst.name] > @distances[vertex.src.name] + vertex.length
          @distances[vertex.dst.name] = vertex.length + @distances[vertex.src.name]
        end
        visited[vertex.dst.name] = true
        paths(dst, Distance.where(src: vertex.dst), visited)
        visited[vertex.dst.name] = false
      end
    end
  end
end
