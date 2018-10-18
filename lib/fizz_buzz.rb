require 'numbers_in_words'
require 'numbers_in_words/duck_punch'
require 'pry'

class FizzBuzz
  def check(number)
    if number.is_not_suitable_for_fizz_buzz
      'Are you for real? This is a negative number!'
    elsif number.is_divisible_by_fifteen?; say_fizzbuzz
    elsif number.is_divisible_by_three?; say_fizz
    elsif number.is_divisible_by_five?; say_buzz
    else
      number
    end
  end

  protected

  def say_something
    method_source = __callee__
    method_source.to_s.sub('say_', '')
  end

  %w[fizzbuzz fizz buzz].each do |message|
    alias_method "say_#{message}", :say_something
  end
end

class Integer
  def method_missing(method, *_args)
    if method.to_s.include? 'is_divisible'
      new_method = method.to_s.sub('is_', '').to_sym
      self.class.send(:define_method, new_method) do
        divider = method.to_s.split('_').last.chomp('?').in_numbers
        self % divider == 0
      end
      send(new_method)
    end
  end
  end

class Object
  def is_not_suitable_for_fizz_buzz
    !is_a?(Integer) || negative?
  end
end
