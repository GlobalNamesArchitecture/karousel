# frozen_string_literal: true

describe Karousel::Job do
  subject { Karousel::Job.new(ClientJobDummy.new) }

  describe '.new' do
    it 'instantiates' do
      expect(subject).to be_kind_of Karousel::Job
      expect(subject.client_job).to be_kind_of ClientJobDummy
    end
  end
end
