require File.dirname(__FILE__) + '/recognition'

recognition = Recognition.new
recognition.run
puts "Learn for TRIANGLE: #{recognition.net.eval(recognition.triangle_input).collect{|x| format("%.2f, ",x)}} => #{recognition.result_label(recognition.net.eval(recognition.triangle_input))}"
puts "Learn for SQUARE: #{recognition.net.eval(recognition.square_input).collect{|x| format("%.2f, ",x)}} => #{recognition.result_label(recognition.net.eval(recognition.square_input))}"
puts "Learn for CROSS: #{recognition.net.eval(recognition.cross_input).collect{|x| format("%.2f, ",x)}} => #{recognition.result_label(recognition.net.eval(recognition.cross_input))}"