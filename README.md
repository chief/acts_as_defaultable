# ActsAsDefaultable

[![Build Status](https://travis-ci.org/chief/acts_as_defaultable.png?branch=master)](https://travis-ci.org/chief/acts_as_defaultable)
[![Code Climate](https://codeclimate.com/github/chief/acts_as_defaultable.png)](https://codeclimate.com/github/chief/acts_as_defaultable)
[![Gem Version](https://badge.fury.io/rb/acts_as_defaultable.png)](http://badge.fury.io/rb/acts_as_defaultable)

## Description

This ``acts_as`` extension provides the capability for having a default object.
The class that has this specified needs to have a default column defined as an integer,
string or boolean on the mapped database table.

## Install

In your Gemfile

```ruby
  gem 'acts_as_defaultable'
```

Currently is tested on rails3.2, ruby 1.9.3 and mysql

## Example

```ruby
  class Country < ActiveRecord::Base
    acts_as_defaultable :default
  end

  gr = Country.new
  gr.default = true
  gr.save
  Country.default == gr # => true
  uk = Country.new
  uk.default = true
  uk.save
  Country.default == gr # => false
```

If no options provided `default` column is assumed.

## Notes

The option to acts_as_defaultable is the `column` of the Model that defines default
behaviour. This column can be a string, a boolean or an integer with default
positive values 'on', true, 1 and default negative values 'off', false, 0 respectively.


## License

acts_as_defaultable is released under the [MIT License](http://opensource.org/licenses/MIT)





