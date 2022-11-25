class Link < ApplicationRecord
	# [DIEGOCHARLES] - IT SHOULD WORK AS A POLIMORPHIC ASSOCIATION, BUT IT'S NOT IMPLEMENTED BECAUSE I'M NOT SURE
	# HOW IT COULD IMPACT THE FRONTEND APP
	belongs_to :company_profile
	belongs_to :university_profile

	validates :url,				presence: true
	# validates :company_profile,		presence: true

	enum kind: [:email, :site, :facebook, :twitter, :youtube, :instagram, :linkedin]

	before_save :set_purpose_as_site_if_not_specified
	before_save :set_as_unique_following_the_kind

	private

	def set_as_unique_following_the_kind
		if company_profile.present?
	  	if kind != :email || kind != :site
	  		company_profile.links.where(kind: kind)
	  		.where.not(id: id).update_all(kind: :site)
	  	end	
	  end
	  
	  if university_profile.present?
	  	if kind != :email || kind != :site
	  		university_profile.links.where(kind: kind)
	  		.where.not(id: id).update_all(kind: :site)
	  	end	
	  end
	end

	def set_purpose_as_site_if_not_specified
    self.kind = :site if kind.nil?
  end
end
