# Nelly the elephant cache

Nelly extends ActiveRecord to add simple support for catching collections of records.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'nelly'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install nelly

## Usage

```ruby
class Post < ActiveRecord::Base
  acts_as_cacheable
end
```

In order to use the cache, call cache method and wrap the cacheable part in a block:

```erb
<% cache(Post) do %>
  <ul>
    <% @posts.each do |post| %>
      <%= render post %>
    <% end %>
  </ul>
<% end %>
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/DVELP/nelly. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

