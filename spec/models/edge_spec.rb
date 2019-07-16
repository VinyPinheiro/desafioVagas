require 'rails_helper'

RSpec.describe Edge, type: :model do
  describe 'Should create edge with' do
    before(:each) do
        @edge = Edge.new(name: 'A')
    end

    it 'valid name' do
      @edge.save()
      expect(@edge).to be_valid
    end

    it 'null name' do
      @edge.name = nil
      @edge.save()
      expect(@edge).to_not be_valid
    end

    it 'existent name' do
      @edge.save()
      edge2 = Edge.create(name: 'A')
      expect(edge2).to_not be_valid
    end
  end
end
