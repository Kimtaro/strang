#!/usr/bin/env ruby

$LOAD_PATH << File.expand_path(File.dirname(__FILE__) + '/lib')
require 'strang'

use Rack::ShowExceptions
run Strang::Server.new