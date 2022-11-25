class AttachmentVideoUploader < CarrierWave::Uploader::Base
  if Rails.env.test?
    storage :file
  else
    include Cloudinary::CarrierWave
  
    process :tags => ['next-step-joboffer-video']

    def content_type_whitelist
      %w(mp4 quicktime)
    end

    def size_range
      0..100.megabytes
    end
  end
end
