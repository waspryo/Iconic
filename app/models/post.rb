class Post < ApplicationRecord
   mount_uploader :image, ImageUploader
     belongs_to :user, optional: true


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
