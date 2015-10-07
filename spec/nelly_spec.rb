require 'nelly'
require 'spec_helper'
require 'support/db/active_record'

class Cacheable < ActiveRecord::Base
  acts_as_cacheable
end

class NonCacheable < ActiveRecord::Base
end

describe Cacheable do
  describe '.cache_key' do
    let(:updated_at) { Time.now }
    let!(:cacheable_object) { Cacheable.create!(updated_at: updated_at) }

    it { expect(described_class).to respond_to(:cache_key) }

    it 'returns a cache key' do
      max_updated_at = updated_at.utc.to_s(:number)
      count = Cacheable.count
      expect(described_class.cache_key).to eq("Cacheable-#{count}-#{max_updated_at}")
    end
  end
end

describe NonCacheable do
  it { expect(described_class).to_not respond_to(:cache_key) }
end
