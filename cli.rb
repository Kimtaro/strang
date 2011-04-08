#!/usr/bin/env ruby

require 'rubygems'
require 'thor'
require 'pp'

$: << File.expand_path(File.dirname(__FILE__) + "/lib")
require 'strang'

class CLI < Thor
  desc 'analyze File', "Analyzes File and spits it back out on STDOUT"
  def analyze(file)
    f = File.open(file, 'rb')
    text = f.read
    puts Strang.new(text).analyze
  end
end

CLI.start