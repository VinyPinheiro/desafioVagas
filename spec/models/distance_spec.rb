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
  describe 'Should calculate distance with two points' do
    before(:each) do
      @a = Edge.create(name: 'A')
      @b = Edge.create(name: 'B')
      @c = Edge.create(name: 'C')
      @d = Edge.create(name: 'D')
      @e = Edge.create(name: 'E')
      @f = Edge.create(name: 'F')

      Distance.create(src: @a, dst: @b, length: 5)
      Distance.create(src: @b, dst: @a, length: 5)

      Distance.create(src: @b, dst: @c, length: 7)
      Distance.create(src: @c, dst: @b, length: 7)

      Distance.create(src: @b, dst: @d, length: 3)
      Distance.create(src: @d, dst: @b, length: 3)

      Distance.create(src: @c, dst: @e, length: 4)
      Distance.create(src: @e, dst: @c, length: 4)

      Distance.create(src: @d, dst: @e, length: 10)
      Distance.create(src: @e, dst: @d, length: 10)

      Distance.create(src: @d, dst: @f, length: 8)
      Distance.create(src: @f, dst: @d, length: 8)
    end

    it ' A to B' do
      expect(Distance.shortest_path(@a, @b)).to eq 5
    end

    it ' A to C' do
      expect(Distance.shortest_path(@a, @c)).to eq 12
    end

    it ' A to D' do
      expect(Distance.shortest_path(@a, @d)).to eq 8
    end

    it ' A to E' do
      expect(Distance.shortest_path(@a, @e)).to eq 16
    end

    it ' A to F' do
      expect(Distance.shortest_path(@a, @f)).to eq 16
    end

    it ' B to C' do
      expect(Distance.shortest_path(@b, @c)).to eq 7
    end

    it ' B to D' do
      expect(Distance.shortest_path(@b, @d)).to eq 3
    end

    it ' B to E' do
      expect(Distance.shortest_path(@b, @e)).to eq 11
    end

    it ' F to A' do
      expect(Distance.shortest_path(@f, @a)).to eq 16
    end

    it ' B to A' do
      expect(Distance.shortest_path(@b, @a)).to eq 5
    end

    it ' F to C' do
      expect(Distance.shortest_path(@f, @c)).to eq 18
    end
  end
end
