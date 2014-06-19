class Post < ActiveRecord::Base
	belongs_to :user

	has_attached_file :image,
     :styles => {
      :original => ['1920x1680>', :jpg, :convert_options => "-auto-orient"],
      :small    => ['100x100#',   :jpg, :convert_options => "-auto-orient"],
      :medium   => ['250x250',    :jpg, :convert_options => "-auto-orient"],
      :large    => ['600x600>',   :jpg, :convert_options => "-auto-orient"]
    }

    validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  	validates :image, :attachment_presence => true
end
