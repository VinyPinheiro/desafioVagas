require 'rails_helper'

RSpec.describe ApplicationForJob, type: :model do
  describe 'Should create ApplicationForJob with' do
    before(:each) do
      edgeA = Edge.create(name: 'A')
      @person = Person.new(name: 'teste', occupation: 'ocupacao teste',
                           edge: edgeA, level: 1)
      @job = Job.new(company: 'teste', title: 'ocupacao teste',
                     description: 'Descrição teste', edge: edgeA, level: 1)
      @application = ApplicationForJob.new(person: @person, job: @job)
    end

    it 'valid data' do
      @application.save()
      expect(@application).to be_valid
    end

    it 'null person' do
      @application.person = nil
      @application.save()
      expect(@application).to_not be_valid
    end

    it 'existent application' do
      @application.save()
      application = ApplicationForJob.new(person: @person, job: @job)
      expect(application).to_not be_valid
    end

    it 'null job' do
      @application.job = nil
      @application.save()
      expect(@application).to_not be_valid
    end
  end

  describe 'Should calculate score' do
    before(:each) do
      @edge_a = Edge.create(name: 'A')
      @edge_b = Edge.create(name: 'B')
      @a_to_b = Distance.create(src: @edge_a, dst: @edge_b, length: 8)
      @b_to_a = Distance.create(src: @edge_b, dst: @edge_a, length: 12)
    end

    it "same edge and same level" do
      person = Person.create(name: 'teste', occupation: 'ocupacao teste',
                           edge: @edge_a, level: 1)
      job = Job.create(company: 'teste', title: 'ocupacao teste',
                     description: 'Descrição teste', edge: @edge_a, level: 1)
      application = ApplicationForJob.create(person: person, job: job)
      expect(application.score).to eq 100
    end

    it "different edge and same level" do
      person = Person.create(name: 'teste', occupation: 'ocupacao teste',
                           edge: @edge_a, level: 1)
      job = Job.create(company: 'teste', title: 'ocupacao teste',
                     description: 'Descrição teste', edge: @edge_b, level: 1)
      application = ApplicationForJob.create(person: person, job: job)
      expect(application.score).to eq 87
    end

    it "same edge and different level" do
      person = Person.create(name: 'teste', occupation: 'ocupacao teste',
                           edge: @edge_a, level: 1)
      job = Job.create(company: 'teste', title: 'ocupacao teste',
                     description: 'Descrição teste', edge: @edge_a, level: 2)
      application = ApplicationForJob.create(person: person, job: job)
      expect(application.score).to eq 87
    end

    it "different edge and different level" do
      person = Person.create(name: 'teste', occupation: 'ocupacao teste',
                           edge: @edge_a, level: 1)
      job = Job.create(company: 'teste', title: 'ocupacao teste',
                     description: 'Descrição teste', edge: @edge_b, level: 2)
      application = ApplicationForJob.create(person: person, job: job)
      expect(application.score).to eq 75
    end

    it "different edge and different level (10 < distance >= 15)" do
      person = Person.create(name: 'teste', occupation: 'ocupacao teste',
                           edge: @edge_b, level: 1)
      job = Job.create(company: 'teste', title: 'ocupacao teste',
                     description: 'Descrição teste', edge: @edge_a, level: 2)
      application = ApplicationForJob.create(person: person, job: job)
      expect(application.score).to eq 62
    end

    it "different edge and different level (15 < distance >= 20)" do
      @b_to_a.length = 18
      @b_to_a.save
      person = Person.create(name: 'teste', occupation: 'ocupacao teste',
                           edge: @edge_b, level: 1)
      job = Job.create(company: 'teste', title: 'ocupacao teste',
                     description: 'Descrição teste', edge: @edge_a, level: 2)
      application = ApplicationForJob.create(person: person, job: job)
      expect(application.score).to eq 50
    end

    it "different edge and different level (distance > 20)" do
      @b_to_a.length = 22
      @b_to_a.save
      person = Person.create(name: 'teste', occupation: 'ocupacao teste',
                           edge: @edge_b, level: 1)
      job = Job.create(company: 'teste', title: 'ocupacao teste',
                     description: 'Descrição teste', edge: @edge_a, level: 2)
      application = ApplicationForJob.create(person: person, job: job)
      expect(application.score).to eq 37
    end
  end
end
