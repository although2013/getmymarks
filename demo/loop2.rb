require 'net/http'
require "uri"
require 'io/console'
require "../res/web_get.rb"
require "../res/deal_with_html.rb"

1.upto(130) do |n|
  if ( web_get((2012021650+n).to_s,'1') ) == -1
    next
  end
  deal_with_html
end
