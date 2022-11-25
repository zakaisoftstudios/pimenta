class AttachmentPictureUploader < CarrierWave::Uploader::Base
  if Rails.env.test?
    storage :file
  else
    include Cloudinary::CarrierWave
  
    process :convert => 'png'
    process :tags => ['next-step-job-offer-picture']

    version :standard do
      process :resize_to_fill => [100, 150, :north]
    end

    version :thumbnail do
      resize_to_fit(50, 50)
    end

    def extension_whitelist
      %w(jpg jpeg gif png)
    end

    def size_range
      1..16.megabytes
    end
  end
end
