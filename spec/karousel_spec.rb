# frozen_string_literal: true

describe Karousel do
  subject { Karousel.new(ClientJobDummy, 20, 0) }

  before(:each) do
    ClientJobDummy.reset
  end

  describe '.version' do
    it 'has version' do
      expect(Karousel.version).to match(/^[\d]+\.[\d]+\.[\d]+$/)
    end
  end

  describe '.new' do
    it 'initiates' do
      expect(subject).to be_kind_of Karousel
    end
  end

  describe '#size' do
    it 'has  size' do
      expect(subject.size).to eq 20
    end
  end

  describe '#time_interval' do
    it 'has time_interval accessor' do
      expect(subject.time_interval).to eq 0
    end
  end

  describe '#seats' do
    it 'has seats' do
      expect(subject.seats).to be_kind_of Array
      expect(subject.seats.size).to eq 0
    end
  end

  describe '#run' do
    it 'should run with block' do
      count = 0
      subject.run do
        count += 1
        if count < 10
          expect(subject.seats[1]).to be_kind_of Karousel::Job
          expect(subject.seats[1].client_job)
            .to be_kind_of ClientJobDummy
        end
      end
    end
  end

  describe '#populate' do
    it 'loads jobs on karousel' do
      expect(subject.seats.size).to eq 0
      subject.populate
      expect(subject.seats.size).to eq 20
      expect(subject.seats[0]).to be_kind_of Karousel::Job
      expect(subject.seats[0].status).to eq Karousel::STATUS[:init]
    end
  end
end
