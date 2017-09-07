class Order < ActiveRecord::Base

  mount_uploader :file1, DocumentUploader
  mount_uploader :file2, DocumentUploader
  mount_uploader :file3, DocumentUploader
end
