module V1
  class PeopleController < ApplicationController
    def create
      person = Person.new(name: params[:nome],
                          occupation: params[:profissao],
                          level: params[:nivel])
      person.edge = find_locality
      if person.save
        render json: { failed: 0 }, status: 201
      else
        render json: { failed: 1, errors: person.errors }, status: 400
      end
    end

    private

    def find_locality
      Edge.find_by(name: params[:localizacao])
    end
  end
end
