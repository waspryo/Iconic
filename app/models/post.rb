class Post < ApplicationRecord
   mount_uploader :image, ImageUploader
   # serialize :image, JSON
     belongs_to :user, optional: true
     has_many :comments
     has_many :likes
     has_many :liked_user, through: :likes, source: :user

     geocoded_by :location
     after_validation :geocode, if: :location_changed?
     default_scope -> { order(created_at: :desc) }


     validates :name, presence: true
     validates :age, presence: true
     validates :occupation, presence: true
     validates :location, presence: true




   private
   def update_image_attributes
     if image.present? && image_changed?
       self.image_content_type = image.filecontent_type
       self.image_file_size = image.file.size
     end
   end
end
