#!/usr/bin/ruby -wKU
require 'net/http'
require "uri"
require "open-uri"
require 'io/console'

require "./res/web_get.rb"
require "./res/deal_with_html.rb"
require "./res/choose_who.rb"
require "./res/write_name_in_cache.rb"

File.delete("html_file") if File.exist?("html_file")

dict = choose_who

real_name = web_get dict[:zjh], dict[:mm] 

deal_with_html

write_name_in_cache  dict[:zjh], dict[:mm], real_name

File.delete("html_file") if File.exist?("html_file")

