class HuntBlueprint < Blueprinter::Base
  identifier :id

  field(:hunt_status) do |hunt, options|
    Nxt::Match::HuntStatus.new(
      student_profile: hunt.student_profile,
      company_profile: hunt.company_profile
    ).get
  end
end