require 'rails_helper'

RSpec.describe Job, type: :model do
  describe 'Should create Job with' do
    before(:each) do
      edgeA = Edge.create(name: 'A')
      @job = Job.new(company: 'teste', title: 'ocupacao teste',
                     description: 'Descrição teste', edge: edgeA, level: 1)
    end

    it 'valid data' do
      @job.save()
      expect(@job).to be_valid
    end

    it 'null company' do
      @job.company = nil
      @job.save()
      expect(@job).to_not be_valid
    end

    it 'null title' do
      @job.title = nil
      @job.save()
      expect(@job).to_not be_valid
    end

    it 'null description' do
      @job.description = nil
      @job.save()
      expect(@job).to_not be_valid
    end

    it 'null edge' do
      @job.edge = nil
      @job.save()
      expect(@job).to_not be_valid
    end

    it 'null level' do
      @job.level = nil
      @job.save()
      expect(@job).to_not be_valid
    end

    it 'string in level' do
      @job.level = 'text'
      @job.save()
      expect(@job).to_not be_valid
    end

    it 'level greater than 5' do
      @job.level = 7
      @job.save()
      expect(@job).to_not be_valid
    end

    it 'level less than 1' do
      @job.level = 0
      @job.save()
      expect(@job).to_not be_valid
    end
  end
end
