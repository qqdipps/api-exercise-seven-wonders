# dotenv_practice.rb
require "dotenv"

# Tell dotenv to look for the .env file
Dotenv.load

puts "Key = #{ENV["API_MOVIE"]}"
