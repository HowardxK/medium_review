require 'rubygems'
require 'hirb-unicode'
require 'active_record'
Hirb.enable
ActiveRecord::Base.logger = Logger.new(STDOUT)

// ~/.irbrc