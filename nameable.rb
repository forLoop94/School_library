class Nameable
  def correct_name
    raise NoImplementedError, "#{self.class} has not implemented the 'correct_name' method."
  end
end
