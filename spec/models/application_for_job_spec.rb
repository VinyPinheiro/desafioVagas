require 'rails_helper'

RSpec.describe ApplicationForJob, type: :model do
    describe 'Should create Person with' do
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
end
