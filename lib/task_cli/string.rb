require 'colorize'

class String
  def apply_color(style)
    colors = { argument: :light_black }
    colorize(colors[style])
  end
end
