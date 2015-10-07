ActiveRecord::Schema.define do
  self.verbose = false

  create_table :posts, force: true do |t|
    t.timestamps null: false
  end
end
