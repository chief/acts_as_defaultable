# ActsAsDefaultable

[![Build Status](https://travis-ci.org/chief/acts_as_defaultable.png?branch=master)](https://travis-ci.org/chief/acts_as_defaultable)
[![Code Climate](https://codeclimate.com/github/chief/acts_as_defaultable.png)](https://codeclimate.com/github/chief/acts_as_defaultable)
[![Gem Version](https://badge.fury.io/rb/acts_as_defaultable.png)](http://badge.fury.io/rb/acts_as_defaultable)
[![Dependency Status](https://gemnasium.com/chief/acts_as_defaultable.png)](https://gemnasium.com/chief/acts_as_defaultable)

## Description

This ``acts_as`` extension provides the capability for having a default object.
The class that has this specified needs to have a default column defined as an integer,
string or boolean on the mapped database table.
There is also optional support for each record to have a default object of another model.

## Install

In your Gemfile

```ruby
  gem 'acts_as_defaultable'
```

Currently is tested on rails3.2, ruby 1.9.3 and mysql

## Example

### Default object

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

### Default object for each record

```ruby
  class User < ActiveRecord::Base
    acts_as_defaultable :default, relation: :post
  end

  class Post < ActiveRecord::Base
    after_destroy User.new
  end

  class Comment < ActiveRecord::Base
  end

  user = User.new
  post = Post.create
  user.default_post = post
  user.save
  user.default_post == post # => true

  post.destroy
  user.reload
  user.default_post == nil # => true

  user.default_post = Comment.create
  user.default_post == nil # => true
```

Only an object of the relation class will be accepted.
The `after_destroy` callback is optional but will ensure that results stay consistent in the event
that a newly created **post** gets the same id as the one destroyed

## Notes

The option to acts_as_defaultable is the `column` of the Model that defines default
behaviour. This column can be a string, a boolean or an integer with default
positive values 'on', true, 1 and default negative values 'off', false, 0 respectively.

The column name for a default relation is `default_column` _ `relation_column` and can be either a string or an integer.

Examples:

```
  class User < ActiveRecord::Base
    acts_as_defaultable :default, relation: :post
  end
```

Column name in users table must be `default_post`

```
  class User < ActiveRecord::Base
    acts_as_defaultable :unique, relation: :post
  end
```

Column name must be `unique_post`

## License

acts_as_defaultable is released under the [MIT License](http://opensource.org/licenses/MIT)





