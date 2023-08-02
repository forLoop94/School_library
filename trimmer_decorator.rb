require_relative 'base_decorator'

class TrimmerDecorator
  def correct_name
    if super.length <= 10
      super
    else
      super[0..9]
    end
  end
end