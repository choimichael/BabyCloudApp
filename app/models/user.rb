class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

  has_many :posts

  has_attached_file :avatar, :styles => { 
  	:medium => "300x300>", :thumb => "50x50>" }

  # has_attached_file :picture,
  #    :styles => {
  #     :original => ['1920x1680>', :jpg, :convert_options => "-auto-orient"],
  #     :small    => ['100x100#',   :jpg, :convert_options => "-auto-orient"],
  #     :medium   => ['250x250',    :jpg, :convert_options => "-auto-orient"],
  #     :large    => ['600x600>',   :jpg, :convert_options => "-auto-orient"]
  #   }

  validates_attachment    :avatar,
                          # presence: true,
                          content_type: { content_type: /\Aimage\/.*\Z/ },
                          size: { less_than: 2.megabyte }

  acts_as_follower
  acts_as_followable
  acts_as_liker
  acts_as_mentionable

end
