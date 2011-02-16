#!/usr/bin/env ruby
require 'rubygems'
require 'thor'
require 'strang'
require 'pp'

class Fixnum
  def chr_u
    [self].pack('U*')
  end
end

class TextAnalyzer
  def initialize(text)
    @text = text.to_s
  end
  
  def analyze
    # Unicode U+ZZZZ, \uZZZZ codepoints to their characters
    @text.gsub! /(?: U\+ | \\u ) (\w+)/x do |m|
      $1.to_i(16).chr_u
    end
    @text
  end  
end

class CLI < Thor
  desc 'analyze File', "Analyzes File and spits it back out on STDOUT"
  def analyze(file)
    f = File.open(file, 'rb')
    text = f.read
    puts TextAnalyzer.new(text).analyze
  end
end

CLI.start