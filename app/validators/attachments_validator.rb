class AttachmentsValidator < ActiveModel::Validator
  def validate(record)
    [:regular, :cover, :avatar, :about, :video].each do |purpose|
      max_size = options[purpose] || 0
      
      size = record.attachments.select do |attachment| 
        attachment.purpose == purpose.to_s
      end.size
      
      record.errors.add(
        :attachments,
        I18n.t(
          'validators.attachments.must_have_maximum', 
          max_size: max_size, 
          purpose: purpose.to_s.pluralize
        )
      ) if size > max_size
    end
  end
end