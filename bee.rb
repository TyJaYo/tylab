#!/usr/bin/env ruby
require 'json'

INPUT_PATH = './dictionary_bee.json'
DICTIONARY = JSON.parse(File.read(INPUT_PATH))

class BeeFinder
  def initialize
    @words = []
    @letters = []
  end

  def run
    greet
    get_letters
    find_words
    show_words
  end

  def greet
    puts "Hello, and welcome to Tyler's Spelling Bee helper 2.0!"
    puts "I'm going to ask you about today's letters, then share possible words."
  end

  def get_letters
    puts "Please enter the letters in today's puzzle, starting with the center letter."
    @letters = gets.strip.downcase.chars.uniq
  end

  def find_words
    DICTIONARY.each do |word|
      gold_letter ||= @letters.first
      next if word.length < 4
      chars = word.chars
      next unless chars.all? { |char| @letters.include?(char) }
      next unless chars.include?(gold_letter)
      @words << word
    end
  end

  def show_words
    puts @words.inspect
    # @words.each do |word|
    #   chars = word.chars
    #   next unless @letters.all? { |letter| chars.include?(letter) }
    #   puts "#{chars[0]}"
    #   puts chars.length
    # end
  end
end

bf = BeeFinder.new
bf.run
