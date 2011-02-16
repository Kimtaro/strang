#!/usr/bin/env ruby
require 'rubygems'
require 'thor'
require 'strang'
require 'pp'

class CLI < Thor
  desc 'analyze File', "Analyzes File and spits it back out on STDOUT"
  def analyze(file)
    f = File.open(file, 'rb')
    text = f.read
    puts Strang.new(text).analyze
  end
end

CLI.start