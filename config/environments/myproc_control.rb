# this is myproc_control.rb
 require 'daemons' 

 Daemons.run_proc('myproc.rb') do
  loop do 
    sleep(5)
  end 
end