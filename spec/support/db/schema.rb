ActiveRecord::Schema.define do
  self.verbose = false

  create_table :cacheables, force: true do |t|
    t.timestamps null: false
  end
end
