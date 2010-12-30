require 'rubygems'
require 'ai4r'
require File.dirname(__FILE__) + '/image_preparation'


class Recognition
  attr_accessor :net, :triangle_input, :square_input, :cross_input
  
  def initialize
    @net = Ai4r::NeuralNetwork::Backpropagation.new([256, 3])
    
    triangle_image = ImagePreparation.new(:file_path => 'images/triangle.png')
    @triangle_input = triangle_image.prepare_data
    square_image = ImagePreparation.new(:file_path => 'images/square.png')
    @square_input = square_image.prepare_data
    cross_image = ImagePreparation.new(:file_path => 'images/cross.png')
    @cross_input = cross_image.prepare_data  
  end
  
  def run
    puts "Training the network, please wait."
    600.times do |i|
      i += 1
      error = self.net.train(self.triangle_input, [1,0,0])
      error = self.net.train(self.square_input, [0,1,0])
      error = self.net.train(self.cross_input, [0,0,1])
      puts "Error after iteration #{i}:\t#{format("%.16f, ",error)}" if i % 50 == 0
    end
  end
  
  def result_label(result)
    if result[0] > result[1] && result[0] > result[2]
      "TRIANGLE"
    elsif result[1] > result[2]
      "SQUARE"
    else
      "CROSS"
    end
  end
end