class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

  has_attached_file :avatar, :styles => { 
  	:medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"

  # has_attached_file :picture,
  #    :styles => {
  #     :original => ['1920x1680>', :jpg, :convert_options => "-auto-orient"],
  #     :small    => ['100x100#',   :jpg, :convert_options => "-auto-orient"],
  #     :medium   => ['250x250',    :jpg, :convert_options => "-auto-orient"],
  #     :large    => ['600x600>',   :jpg, :convert_options => "-auto-orient"]
  #   }

  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

end
