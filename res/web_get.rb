#!/usr/bin/env ruby -wKU
#encoding = utf-8
require 'net/http'
require "open-uri"

def web_get(username,passwd)

http = Net::HTTP.new('60.219.165.24', 80, nil, nil)

request2 = Net::HTTP::Post.new('/loginAction.do')

request2.set_form_data({ 'zjh' => username, 'mm' => passwd })

response2 = http.request(request2)
cookies = response2["set-cookie"]
if response2.code == '200'
  #puts "登录成功"  #不一定能保证密码正确。。
else
  puts "SORRY，可能密码错误或登录太频繁 #{response2.code}"
  exit 0
end



request_marks = Net::HTTP::Get.new('/bxqcjcxAction.do')

request_marks['Cookie'] = cookies
#puts request_marks['Cookie']

respones_marks = http.request(request_marks)

html_file = respones_marks.body
file = File.new("html_file","w")
  file.puts(html_file)
file.close




request_get_name = Net::HTTP::Get.new('/menu/s_top.jsp')

request_get_name['Cookie'] = cookies

response_get_name = http.request(request_get_name)
if response_get_name.code != '200'
  puts "SORRY,error #{response_get_name.code}"
  exit 0
end
real_name = response_get_name.body.to_s
              .encode(Encoding.find("UTF-8"),Encoding.find("GBK"))
              .match(/\b欢迎光临&nbsp;.*&nbsp;\|/).to_s
              .split('')[10..-8].join()
							
puts "                       Welcome #{real_name} #{username}"

return real_name

end


