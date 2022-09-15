class Solver
  def factorial(num)
    answer = 1
    while num.positive?
      answer *= num
      num -= 1
    end
    answer
  end

  def reverse(str)
    str.reverse
  end

  def fizzbuzz(num)
    if (num % 15).zero?
      'FizzBuzz'
    elsif (num % 3).zero?
      'Fizz'
    elsif (num % 5).zero?
      'Buzz'
    else
      num.to_s
    end
  end
end
