class Owner < ActiveRecord::Base
  has_one :mypowner, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :comments, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :omniauthable
         mount_uploader :avatar, AvatarUploader
         def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
           owner = Owner.find_by(provider: auth.provider, uid: auth.uid)

           unless owner
             owner = Owner.new(
                 name:     auth.extra.raw_info.name,
                 provider: auth.provider,
                 uid:      auth.uid,
                 email:    "#{auth.uid}-#{auth.provider}@example.com",
                 image_url:   auth.info.image,
                 password: Devise.friendly_token[0, 20]
             )
             owner.skip_confirmation!
             owner.save(validate: false)
           end
           owner
         end

    mount_uploader :avatar, AvatarUploader

    def update_with_password(params, *options)
      if provider.blank?
          super
      else
          params.delete :current_password
          update_without_password(params, *options)
      end
   end
end
