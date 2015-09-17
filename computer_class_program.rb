class Computer
  
  @@users = {}
  
  def initialize(username, password)
    @username = username
    @password = password
    @@files = {}
    @@users[username] = password
  end
  
  def create(username, password, filename)
    if password == @@users[username]
      time = Time.now
      @@files[filename] = time
      puts "The file, #{filename} was created on #{time} by user: #{username}."
    else
      puts "ERROR! Incorrect password for username: #{username}.\nPlease try again."
    end
  end
  
  def delete(filename)
    if @@files[filename].nil?
      puts "ERROR! The file you had entered, #{filename}, does not exist."
    else
      @@files.delete(filename)
    end
  end
  
  @@formatted = Proc.new { |key, value| puts "#{key}: #{value}" }
  
  def Computer.get_users
    @@users.map(&@@formatted)
  end
  
  def Computer.get_files
    @@files.map(&@@formatted)
  end
  
end