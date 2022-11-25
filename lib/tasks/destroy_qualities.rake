desc 'Destroy qualities'

namespace :db do
  namespace :seed do
    task :destroy_qualities => :environment do
      StudentProfileSkill.destroy_all
      StudentProfileInterest.destroy_all
      StudentProfileStrength.destroy_all
      JobOfferSkill.destroy_all
      JobOfferStrength.destroy_all
      JobOfferInterest.destroy_all
      SubjectOfferSkill.destroy_all
      SubjectOfferInterest.destroy_all
      SubjectOfferStrength.destroy_all
      Skill.destroy_all
      Interest.destroy_all
      Strength.destroy_all
    end
  end
end