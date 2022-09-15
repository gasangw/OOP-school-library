class Solver
  def factorial(n)
    answer = 1
    while n > 0 do
      answer *= n
      n = n-1
    end
    return answer
  end

  def reverse(str)
    str.reverse
  end

  def fizzbuzz(n)
    if n % 15 === 0
      return "FizzBuzz"
    elsif n % 3 === 0
      return "Fizz"
    elsif n % 5 === 0
      return "Buzz"
    else
      "#{n}"
    end
  end
end
