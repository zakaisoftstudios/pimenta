class CertificatePdfUploader < CarrierWave::Uploader::Base
  if Rails.env.test?
    storage :file
  else
    include Cloudinary::CarrierWave
  
    process :tags => ['next-step-profile-picture']

    def extension_whitelist
      %w(pdf)
    end

    def size_range
      1..16.megabytes
    end
  end
end
