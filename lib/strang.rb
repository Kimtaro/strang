# Encoding: UTF-8

# TODO: Use https://github.com/speedmax/rchardet ?

require 'rubygems'
require 'pp'
require 'cgi'
require 'strang/server'

class Fixnum
  def chr_u
    [self].pack('U*')
  end
end

class Strang
  def initialize(text)
    @text = text.to_s
  end
  
  def analyze
    # Unicode U+ZZZZ, \uZZZZ codepoints to their characters
    @text.gsub! /(?: U\+ | \\u ) (\w+)/x do |m|
      $1.to_i(16).chr_u
    end
    
    # URL decode
    @text = CGI::unescape(@text)
    
    @text
  end  
end
