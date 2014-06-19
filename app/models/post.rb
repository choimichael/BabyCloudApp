class Post < ActiveRecord::Base
	belongs_to :user

	has_attached_file :image,
     :styles => {
      :original => ['1920x1680>', :jpg, :convert_options => "-auto-orient"],
      :small    => ['100x100#',   :jpg, :convert_options => "-auto-orient"],
      :medium   => ['250x250',    :jpg, :convert_options => "-auto-orient"],
      :large    => ['600x600>',   :jpg, :convert_options => "-auto-orient"]
    }

		before_post_process :load_exif

    validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  	validates_attachment_presence :image

  	def to_jq_upload
	    {
	      "name" => read_attribute(:image_file_name),
	      "size" => read_attribute(:image_file_size),
	      "url" => image.url(:original),
	      "delete_url" => post_path(self),
	      "delete_type" => "DELETE" 
	    }
  	end

  	def load_exif
  		exif = EXIFR::JPEG.new(image.queued_for_write[:original].path)

  		# Return if exif.nil? or not exif.exif?
  		self.date = exif.date_time.to_date
  		self.latitude = exif.gps.latitude
  		self.longitude = exif.gps.longitude
  	rescue
  		false
  	end
end
