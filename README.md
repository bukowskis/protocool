[![Build Status](https://travis-ci.org/bukowskis/protocool.png)](https://travis-ci.org/bukowskis/protocool)

# Protocool

Decides whether to use TLS encryption or not on a per-environment basis in Rails. Inspired by [this discussion](http://stackoverflow.com/questions/3634100/rails-3-ssl-deprecation).

# Installation

```bash
gem install protocool
````

# Usage

#### Syntax

```ruby
# In development mode:
Protcool.https   # => 'http'

# In any other environment:
Protcool.https   # => 'https'
````

#### Examples 

In your routes:

```ruby
scope constraints: { protocol: "#{Protocool.https}://" } do
  # ...
end
```
