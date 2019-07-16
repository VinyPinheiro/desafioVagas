require 'rails_helper'

RSpec.describe Distance, type: :model do
    describe 'Should create distance with' do
      before(:each) do
        @edgeA = Edge.create(name: 'A')
        @edgeB = Edge.create(name: 'B')
        @distance = Distance.new(src: @edgeA, dst: @edgeB, length: 5)
      end

      it 'valid data' do
        @distance.save()
        expect(@distance).to be_valid
      end

      it 'null src' do
        @distance.src = nil
        @distance.save()
        expect(@distance).to_not be_valid
      end

      it 'null dst' do
        @distance.dst = nil
        @distance.save()
        expect(@distance).to_not be_valid
      end

      it 'null length' do
        @distance.length = nil
        @distance.save()
        expect(@distance).to_not be_valid
      end

      it 'no numeric length' do
        @distance.length = 'text'
        @distance.save()
        expect(@distance).to_not be_valid
      end

      it 'no integer length' do
        @distance.length = 2.55
        @distance.save()
        expect(@distance).to_not be_valid
      end
    end
end
