# frozen_string_literal: true

# Was getting lots of errors like this:
#
# ~/.rvm/gems/ruby-2.7.2@cookbook/gems/json-1.8.6/lib/json/common.rb:155:
# warning: Using the last argument as keyword parameters is deprecated
#
# Found here: https://github.com/flori/json/issues/399
# "Using Rails, this seems to get rid of the warnings:"

# config/initializers/json.rb
module JSON
  module_function

  # :nocov:
  def parse(source, opts = {})
    Parser.new(source, **opts).parse
  end
  # :nocov:
end
