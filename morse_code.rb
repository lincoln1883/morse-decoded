def decode_char(str)
  alph = {
    '.-' => 'A', '-...' => 'B', '-.-.' => 'C', '-..' => 'D',
    '.' => 'E', '..-.' => 'F', '....' => 'H', '..' => 'I',
    '.---' => 'J', '-.-' => 'K', '.-..' => 'L', '--' => 'M',
    '-.' => 'N', '---' => 'O', '.--.' => 'P', '--.-' => 'Q', '.-.' => 'R',
    '...' => 'S', '-' => 'T', '..-' => 'U', '...-' => 'V', '.--' => 'W',
    '-..-' => 'X', '-.--' => 'Y', '--..' => 'Z'
  }
  alph[str]
end

def decode_word(str)
  word = ''
  char = ''
  str.length.times do |i|
    if str[i] == ' '
      word = "#{word}#{decode_char(char)}"
      char = ''
    elsif i == str.length - 1
      char = "#{char}#{str[i]}"
      word = "#{word}#{decode_char(char)}"
    else
      char = "#{char}#{str[i]}"
    end
  end
  word
end

def decode(str)
  mess = str.split('   ')
  new_message = mess.map { |word| decode_word(word) }
  new_message.join(' ')
end

message = '.-   -... --- -..-   ..-. ..- .-.. .-..   --- ..-.   .-. ..- -... .. . ...'
puts decode(message)
