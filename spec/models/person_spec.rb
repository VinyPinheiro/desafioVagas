require 'rails_helper'

RSpec.describe Person, type: :model do
  describe 'Should create Person with' do
    before(:each) do
      edgeA = Edge.create(name: 'A')
      @people = Person.new(name: 'teste', occupation: 'ocupacao teste', edge: edgeA, level: 1)
    end

    it 'valid data' do
      @people.save()
      expect(@people).to be_valid
    end

    it 'null name' do
      @people.name = nil
      @people.save()
      expect(@people).to_not be_valid
    end

    it 'null occupation' do
      @people.occupation = nil
      @people.save()
      expect(@people).to_not be_valid
    end

    it 'null edge' do
      @people.edge = nil
      @people.save()
      expect(@people).to_not be_valid
    end

    it 'null level' do
      @people.level = nil
      @people.save()
      expect(@people).to_not be_valid
    end

    it 'string in level' do
      @people.level = 'text'
      @people.save()
      expect(@people).to_not be_valid
    end

    it 'level greater than 5' do
      @people.level = 7
      @people.save()
      expect(@people).to_not be_valid
    end

    it 'level less than 1' do
      @people.level = 0
      @people.save()
      expect(@people).to_not be_valid
    end
  end
end
