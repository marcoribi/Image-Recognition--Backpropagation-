require 'rubygems'
require 'RMagick'
include Magick

class ImagePreparation
  attr_accessor :image
  
  def initialize(options = {})
    @image = ImageList.new(options[:file_path]) if options.has_key?(:file_path)
    @data = []
  end
  
  def prepare_data
    @image.each_pixel do |pixel, column, row|
      @data << (((pixel.red + pixel.green + pixel.blue) / 3).to_f / 65535.0)
    end
    @data
  end
end