require 'nelly'
require 'spec_helper'
require 'support/db/active_record'

class Post < ActiveRecord::Base
  acts_as_cacheable
end

class Comment < ActiveRecord::Base
end

describe Post do

  describe '.cache_key' do
    let(:updated_at) { Time.now }
    let!(:cacheable_object) { Post.create!(updated_at: updated_at) }

    subject{ Post.cache_key }

    it 'returns a cache key' do
      max_updated_at = updated_at.utc.to_s(:number)
      count = Post.count
      expect(subject).to eq("Post-#{count}-#{max_updated_at}")
    end
  end
end

describe Comment do
  it 'does not act as cacheable' do
    expect(Comment).to_not respond_to(:cache_key)
  end
end
