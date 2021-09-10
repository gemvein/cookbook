# frozen_string_literal: true

require 'action_view'

# Give Floats the ability to display with human-readable precision
class Float
  def format_quantity
    to_s.sub(/\.?0+$/, '')
  end
end
