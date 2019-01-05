class Post < ApplicationRecord
   mount_uploader :image, ImageUploader


   private
   def update_image_attributes
     if image.present? && image_changed?
       self.image_content_type = image.filecontent_type
       self.image_file_size = image.file.size
     end
   end
end
