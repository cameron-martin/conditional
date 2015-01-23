# Conditional

Ruby's if/elsif/else, but not using native constructs.
Mostly just as an exercise on how ruby should have implemented ifs, but it has some practical uses (see usage).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'conditional'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install conditional

## Usage

It works almost exactly like ruby's native constructs, except for:

* Body of conditionals have their own scope
* else/else_nil branch must be specified
* The condition is passed to the block

The third point comes in very useful when dealing with regexes.

Instead of

```ruby
match = %r{^http://github.com/(.*?)/}.match(url)

user_name = if match
  match[1]
else
  raise 'Incorrect url format'
end
```

which  pollutes your current scope with the throw-away match variable, you can write

```ruby
user_name = If %r{^http://github.com/(.*?)/}.match(url) do |match|
  match[1]
end.else do
  raise 'Incorrect url format'
end
```

elsifs are supported too:

```ruby
If if_condition do
  # do something
end.elsif another_condition do
  # or this
end.else do
  # otherwise this
end
```

If you don't want to supply an if condition, you can use else_nil:

```ruby
value_or_nil = If condition do
  :value
end.else_nil
```

## Contributing

1. Fork it ( https://github.com/cameron-martin/conditional/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
