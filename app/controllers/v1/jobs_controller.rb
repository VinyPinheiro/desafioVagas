module V1
  class JobsController < ApplicationController
    def create
      job = Job.new(company: params[:empresa],
                    title: params[:titulo],
                    description: params[:descricao],
                    level: params[:nivel])
      job.edge = find_locality
      if job.save
        render json: { failed: 0 }, status: 201
      else
        render json: { failed: 1, errors: job.errors }, status: 400
      end
    end

    private

    def find_locality
      Edge.find_by(name: params[:localizacao])
    end
  end
end
