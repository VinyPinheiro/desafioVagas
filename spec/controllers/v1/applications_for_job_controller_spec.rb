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

  describe 'Should getting ranking ApplicationForJob' do
    before(:each) do
      a = Edge.create(name: 'A')
      b = Edge.create(name: 'B')
      c = Edge.create(name: 'C')
      d = Edge.create(name: 'D')
      e = Edge.create(name: 'E')
      f = Edge.create(name: 'F')

      Distance.create(src: a, dst: b, length: 5)
      Distance.create(src: b, dst: a, length: 5)

      Distance.create(src: b, dst: c, length: 7)
      Distance.create(src: c, dst: b, length: 7)

      Distance.create(src: b, dst: d, length: 3)
      Distance.create(src: d, dst: b, length: 3)

      Distance.create(src: c, dst: e, length: 4)
      Distance.create(src: e, dst: c, length: 4)

      Distance.create(src: d, dst: e, length: 10)
      Distance.create(src: e, dst: d, length: 10)

      Distance.create(src: d, dst: f, length: 8)
      Distance.create(src: f, dst: d, length: 8)

      @job = Job.create(company: 'teste', title: 'ocupacao teste',
                        description: 'Descrição teste', edge: a, level: 4)
      @person1 = Person.create(name: 'Mary Jane', occupation: 'Engenheira de Software', edge: a, level: 4)
      @person2 = Person.create(name: 'John Doe', occupation: 'Engenheira de Software', edge: c, level: 2)

    end

    it 'register with desc order' do
      require 'json'
      ApplicationForJob.create(job: @job, person: @person2)
      ApplicationForJob.create(job: @job, person: @person1)
      get :ranking, params: { id: @job.id }

      expect(response).to have_http_status(200)
      expected_hash
    end

    it 'register with cres order' do
      require 'json'
      ApplicationForJob.create(job: @job, person: @person1)
      ApplicationForJob.create(job: @job, person: @person2)
      get :ranking, params: { id: @job.id }

      expect(response).to have_http_status(200)
      expected_hash
    end

    def expected_hash
      expect(JSON.parse(response.body)[0]['nome']).to eq(@person1.name)
      expect(JSON.parse(response.body)[1]['nome']).to eq(@person2.name)
    end
  end
end
