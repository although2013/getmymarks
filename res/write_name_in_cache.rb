def write_name_in_cache (zjh,mm,real_name)
  if real_name.to_i == -1
    return 0
  end
  if File.exist?("usercache.txt")
      File.foreach("usercache.txt") do |line|  
      user_id = line[0,10].to_s
      if zjh.to_s == user_id
        return 0
      end
    end
  end
  File.open("usercache.txt", "a") do |fileusr| 
    fileusr.puts "#{zjh} #{real_name}"
  end
end
