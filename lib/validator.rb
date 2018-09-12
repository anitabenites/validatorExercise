class Validator
  def validate_word?(param)
    return /^[A-Za-z]+,?$/.match?(param)
  end

  def validate_sentence?(sentence)
    # 1st way to solve the problem:
    # return /^[a-zA-Z]+[a-zA-Z,\s]+[.?!]$/.match?(sentence)
    # 2nd way to solve a problem:
    before_ending = sentence[0...-1]
    last_character = sentence[-1]
    words = before_ending.split(" ")
    return false unless words.all? { |word| validate_word?(word) }
    return false unless [".", "!", "?"].include?(last_character)
    return true
  end
end
