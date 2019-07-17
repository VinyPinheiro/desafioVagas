module V1
  class ApplicationsForJobController < ApplicationController
    def create
      application = ApplicationForJob.new(person: find_person, job: find_job)
      if !existent_application.empty?
        render json: { failed: 1 }, status: 409
      elsif application.save
        render json: { failed: 0 }, status: 201
      else
        render json: { failed: 1, errors: application.errors }, status: 400
      end
    end

    def ranking
      applications = ApplicationForJob.where(job_id: params[:id])
                                      .sort_by(&:score).reverse
      render json: prepare_data(applications)
    end

    private

    def prepare_data(applications)
      hash = []
      applications.each do |application|
        person = application.person
        hash << { nome: person.name,
                  profissao: person.occupation,
                  localizacao: person.edge.name,
                  nivel: person.level,
                  score: application.score }
      end
      hash
    end

    def find_person
      Person.find_by(id: params[:id_pessoa])
    end

    def find_job
      Job.find_by(id: params[:id_vaga])
    end

    def existent_application
      ApplicationForJob.where(job_id: params[:id_vaga])
                       .where(person_id: params[:id_pessoa])
    end
  end
end
