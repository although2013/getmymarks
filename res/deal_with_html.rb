def deal_with_html()
  file = File.readlines("html_file")
  marks = []
  for i in file
    if i.to_s.force_encoding("gbk").match(/<td align="center">/)
      push_in = 1
    end
    if 	push_in == 1
      ishort = i.gsub(/\s+/,'').gsub(/\<\/td\>/,'').gsub(/\<\/tr\>/,'').gsub(//,'')
      if ishort.length > 0 && ishort.length < 18
        marks.push(ishort.to_s.encode(Encoding.find("UTF-8"),Encoding.find("GBK")))
      end
    end
    if i.to_s.force_encoding("gbk").match(/<\/TABLE>/)
      push_in = 0
    end
  end

	#p marks

  arr = []
  i=0
  while i < (marks.length-1)
    if  marks[i].match(/(必|选)修/) 
      arr.push(marks[i])
      if marks[i+1].match(/[0-9][0-9]/) && marks[i+1].length <3
        arr.push(marks[i+1])
        i=i+2
      elsif marks[i+1].match(/(良好|优秀|中等|及格)/)
        arr.push(marks[i+1])
        i=i+2
      else
        arr.push("none")
        i=i+1
      end
    else
      arr.push(marks[i])
      i += 1
    end
    if marks[i].match(/任选/)
      arr.push(marks[i])
      if marks[i+1].match(/合格/)
        arr.push("合格")
      else
        arr.push("none")
      end
      i=i+1
    end
  end

  #puts arr

  puts " 课程号 序号       课程名              学分     属性    成绩"
  puts "----------------------------------------------------------------"

  for i in 0..(arr.length-1)
    print "\n" if i%6 == 0 and i!=0
    2.step(arr.length-1,6) do |xueke|
      if i == xueke
        #print "#{arr[i].length} #{arr[i].force_encoding("ascii").length}"
        if arr[i].force_encoding("ascii").length.to_i < 22
          arr[i] += "\t"
        end
      end
    end
    print "#{arr[i]}\t"
  end
  puts ""
end
