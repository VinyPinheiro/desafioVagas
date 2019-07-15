require 'rails_helper'

RSpec.describe Locality, type: :model do
  describe 'Should create Locality with' do
    before(:each) do
        @local = Locality.new(local_one: 'A', local_two: 'B', distance: 5)
    end

    it 'valid data' do
      @local.save()
      expect(@local).to be_valid
    end

    it 'null local one' do
      @local.local_one = nil
      @local.save()
      expect(@local).to_not be_valid
    end

    it 'null local two' do
      @local.local_two = nil
      @local.save()
      expect(@local).to_not be_valid
    end

    it 'null distance' do
      @local.distance = nil
      @local.save()
      expect(@local).to_not be_valid
    end

    it 'no numeric distance' do
      @local.distance = 'text'
      @local.save()
      expect(@local).to_not be_valid
    end

    it 'no integer distance' do
      @local.distance = 2.55
      @local.save()
      expect(@local).to_not be_valid
    end
  end
end
