class UpdateSkillsLabel < ActiveRecord::Migration[5.0]
  def change
    Skill.find_by_label("Personla").update(label: "Personal") if Skill.find_by_label("Personla").present?
    Skill.find_by_label("Vetrieb").update(label: "Vertrieb") if Skill.find_by_label("Vetrieb").present?
    Skill.find_by_label("Abbrechnung").update(label: "Abrechnung") if Skill.find_by_label("Abbrechnung").present?
  end
end
