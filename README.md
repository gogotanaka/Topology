# Topology


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'topology'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install Topology

## Usage

```ruby
top = Topology.new Set[Set[1], Set[2]]
=> #<Topology:0x007f8074132c60 @sos=#<Set: {#<Set: {1}>, #<Set: {2}>, #<Set: {1, 2}>, #<Set: {}>}>>
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/Topology/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
