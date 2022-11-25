class LikeBlueprint < Blueprinter::Base
  identifier :id

  field(:job_like_status) do |like, options|
    Nxt::Match::JobLikeStatus.new(
      student_profile: like.student_profile,
      job_offer: like.job_offer
    ).get
  end
end