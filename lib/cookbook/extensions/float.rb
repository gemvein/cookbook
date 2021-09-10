require 'action_view'

class Float
  def format_quantity
    to_s.sub(/\.?0+$/, '')
  end
end