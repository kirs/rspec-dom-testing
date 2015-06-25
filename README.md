# RSpec DOM Testing

[![Build Status](https://travis-ci.org/kirs/rspec-dom-testing.svg)](https://travis-ci.org/kirs/rspec-dom-testing)

Port of [rails-dom-testing](https://github.com/rails/rails-dom-testing) gem into RSpec, including some batteries.

### Problem

Rails 5 deprecates controller testing in favor of integration testing.
In Rails 4 and 5, you could write expectations on `assigns` and `render_template`, like:

```ruby
get :index

expect(assings(:posts).size).to eq 2
expect(assings(:posts)).to include post

expect(response).to render_template("_post")
```

In Rails 5 you can't access internal variables or templates, since it's controller private logic.

Instead of it, now you have to check response body for matching content, like:

```ruby
get :index

expect(response.body).to include "Post title"
```

### Solution

For better DSL, this gem allows to write DOM expectations:

```ruby
get :index

# body should have two .post divs
expect(response).to have_css_selector("div.post", 2)
```

```ruby
get :sign_in

# body should have any number of .sign_in blocks
# .sign_in block should have email and password fields
expect(response).to have_css_selector(".sign_in") do |signin|
  expect(signin).to have_css_selector(".email")
  expect(signin).to have_css_selector(".password")
end
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rspec-dom-testing'
```

And then execute:

    $ bundle

Enable new matchers in your `spec_helper`:
```ruby
spec/spec_helper.rb
RSpec.configure do |config|
  # ...
  config.include RspecDomTesting::Matchers
end
```


## Usage

TODO: Write usage instructions here

## Contributing

1. Fork it ( https://github.com/[my-github-username]/rspec-dom-testing/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
