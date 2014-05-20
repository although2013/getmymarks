def choose_who ()
	if not File.exist?("usercache.txt")
		print "输入学号: "
		zjh = gets.chomp
		
	else
		arr_user_id = []
		File.foreach("usercache.txt") do |line| 
			user_id = line[0,10].to_s
			real_name = line[11..-2].to_s
		
			arr_user_id.push({user_id:user_id,real_name:real_name})
		end
		1.upto(arr_user_id.length) do |i|
			puts "   #{i}  #{arr_user_id[i-1][:user_id]} #{arr_user_id[i-1][:real_name]}"	
		end

		print "输入上面的序号或者直接输入需要查询的学号:"
		num = gets.chomp
		if num.length == 10
			zjh = num
		else
			zjh = arr_user_id[num.to_i-1][:user_id]
		end
	end

	print "输入密码（密码不会显示于屏幕上）:"
	mm = STDIN.noecho{ gets.chomp }
	puts ""

	return {zjh:zjh,mm:mm}
end
