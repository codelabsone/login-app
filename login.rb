puts `clear`
#***************************************************************************************
# def simple_loop #define method name
#     puts "before"
#     yield # hand off to custom iterator <------------
#     puts "after"                                  # |
# end                                               # |
# # must take a block                               # |
# # block with curly braces                         # |
# #simple_loop {puts "In the block curly braces"}#<-----
# #or                                               # |
# # block with do and end                           # |
#  simple_loop do                                   # |
#    puts "In the block with do and end"#<-------------
#  end

#***************************************************************************************

# users = ['jeff','lee','zach']
# # defining our method
# def usernames(names) # This method takes one parameter
#   names.each do |name| # Loop through the array with .each
#     yield(name) # hand off to custom iterator
#   end
# end
# # Calling our method
# usernames(users) do |name| # Calling our iterator and looping through the array with .each
#   if users.include? name # checking the name aginst the array
#     puts "#{name.capitalize} is a valid user!" # print if true
#   else
#     puts "This is an invalid user good bye." #print if false
#   end
# end
# Not very useful in this case would have been easier with a simple .each loop

#***************************************************************************************

# users.each do |name|
#   if users.include? name
#     puts "#{name.capitalize} is a valid user!"
#   else
#     puts "This is an invalid user good bye."
#   end
# end

#***************************************************************************************

# users = ['jeff','lee','zach']
# login_attempt = "joe"
# # defining our method
# def usernames(names) # This method takes one parameter
#   names.each do |name| # Loop through the array with .each
#     yield(name) # hand off to custom iterator
#   end
# end
# # Calling our
# i = 0
# j = 0
# usernames(users) do |name| # Calling our iterator
#   if users.include? login_attempt # checking the name aginst the array
#     j += 1
#     if j == 1
#       puts "#{name.capitalize} is a valid user!" # print if true
#     end
#       elsif unless users.include? login_attempt
#         i += 1
#       end
#         if i == users.length
#           puts "#{login_attempt.capitalize} is not a valid user!"
#         end
#     end
#   end

  #***************************************************************************************
#example with user input
  require 'ruby-progressbar'
  require 'colorize'
  require 'io/console'

  require_relative 'userdb.rb'
  users = $users
  #users = ['jeff','lee','zach']
  puts "Enter your username.".green
  login_attempt = gets.chomp.downcase
  puts `clear`
  # defining our method
  def usernames(names) # This method takes one parameter
    names.each do |name| # Loop through the array with .each
      yield(name) # hand off to custom iterator
    end
  end
  # Calling our method
  i = 0
  j = 0
usernames(users) do |name| # Calling our iterator
    if users.include? login_attempt # checking the name aginst the array
      j += 1
        if j == 1
          puts "#{login_attempt.capitalize} is a valid user! Please enter your password".green # print if true
        password = STDIN.noecho(&:gets).chomp
        if password == "Password1"
          puts "Login Successful!".green
          sleep(1)
          puts `clear`
          puts "Starting download..."
          sleep(1)
          puts `clear`
          system("cmatrix")
        else puts "Login Failed".red
        end
        end
    elsif unless users.include? login_attempt
       i += 1
    end
          if i == users.length
            print "#{login_attempt.capitalize} is not a valid user!".green
            t = 0
            while t < 3
              sleep(1.0/2.5)
            print'.'
            t += 1
           end
           sleep(1)
            print "Would you like to add #{login_attempt.capitalize} as a user? (y/n)".green
            response = gets.chomp.downcase
            puts `clear`
            if response == 'y'
              puts `clear`
              print "Adding #{login_attempt.capitalize}".green
            progressbar =  ProgressBar.create( :format         => "%a %b\u{15E7}%i %p%% %t".red,
                                  :progress_mark  => ' ',
                                  :remainder_mark => "\u{FF65}",
                                  :starting_at    => 10)

                                  k = 10
                                  while k < 100
                                    sleep(1.0/4.0)
                                    3.times { progressbar.increment }
                                    k += 3
                                  end
                                  puts `clear`

              puts "#{login_attempt.capitalize} has been added sucessfully!".green
                users.push(login_attempt)
                print "User List:".green
                l = 0
                users.each do |user|
                    print "#{' and'.red unless l != users.size - 1} #{user.capitalize.red}#{','.red unless l >= users.size - 1 || l >= users.size - 2}#{'(New User)' unless l != users.size - 1}"
                    l += 1
                end
                sleep 1
                puts
                puts
            end
            File.write('userdb.rb', "$users = #{users}")
            break
          end
    end
end
