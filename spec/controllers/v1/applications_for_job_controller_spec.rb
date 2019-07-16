require 'rails_helper'

RSpec.describe V1::ApplicationsForJobController, type: :controller do
  describe 'Should create ApplicationForJob with ' do
    before(:each) do
      edgeA = Edge.create(name: 'A')
      @person = Person.create(name: 'teste', occupation: 'ocupacao teste',
                              edge: edgeA, level: 1)
      @job = Job.create(company: 'teste', title: 'ocupacao teste',
                        description: 'Descrição teste', edge: edgeA, level: 1)
    end

    it 'valid post params' do
      post :create, params: {
                              id_vaga: @job.id,
                              id_pessoa: @person.id }
      expect(response).to have_http_status(201)
      expect(response.body).to include_json(
        failed: 0)
    end

    it 'null params' do
      post :create
      expect(response).to have_http_status(400)
      expect(response.body).to include_json(
        failed: 1)
    end

    it 'incorrect params params' do
      post :create, params: {
                              id_vaga: 555,
                              id_pessoa: @person.id }
      expect(response).to have_http_status(400)
      expect(response.body).to include_json(
        failed: 1)
    end

    it 'existent application' do
      ApplicationForJob.create(person: @person, job: @job)
      post :create, params: {
                              id_vaga: @job.id,
                              id_pessoa: @person.id }
      expect(response).to have_http_status(409)
      expect(response.body).to include_json(
        failed: 1)
    end

  end
end
