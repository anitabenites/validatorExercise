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
    return "it is not a valid word" unless words.all? { |word| validate_word?(word) }
    return "it is not a valid sentence because it does not finish in one of the three punctuations {'.', '!', '?'}" unless [".", "!", "?"].include?(last_character)
    return "valid"
  end
end
