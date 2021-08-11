require "digest"

if (Gem.win_platform?)
    Encoding.default_external = Encoding.find(Encoding.locale_charmap)
    Encoding.default_internal = __ENCODING__
  
    [STDIN, STDOUT].each do |io|
      io.set_encoding(Encoding.default_external, Encoding.default_internal)
    end
end

puts "Введите слово или фразу для шифрования:"
phrase_or_word = STDIN.gets.chomp.encode("UTF-8")
puts "Каким способом зашифровать:"
puts "1. MD5" 
puts "2. SHA1"
sposob = STDIN.gets.to_i

until sposob.between?(1, 2)
  puts "Выберите 1 или 2"
  sposob = STDIN.gets.to_i
end

case sposob
when 1
  puts "Вот что получилось:"
  puts Digest::MD5.hexdigest phrase_or_word
when 2
    puts "Вот что получилось:"
    puts Digest::MD5.hexdigest phrase_or_word
end