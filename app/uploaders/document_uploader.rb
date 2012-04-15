# encoding: utf-8

class DocumentUploader < CarrierWave::Uploader::Base

  # Include RMagick or ImageScience support:
  #include CarrierWave::RMagick
  # include CarrierWave::ImageScience

  # Choose what kind of storage to use for this uploader:
  if Rails.env.production?
    storage :fog
  else
    storage :file
  end

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  def scale(width, height)
#    manipulate! do |img|
#      img.crop!(109, 0, width, height)
#      img.resize!(298, 298)
#    end
  end

  # Create different versions of your uploaded files:
  #version :square do
  #  process :scale => [415, 415]
  #end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    %w(doc docx pdf)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end
