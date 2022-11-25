class QualitiesValidator < ActiveModel::Validator
  MUST_HAVE_MIN = 1
  MUST_HAVE_MAX = 5
  CAN_HAVE_MAX = 5

  def validate(record)
    prefix = options[:prefix]

    [
      { name: "#{prefix}_skills", id_name: :skill_id }, 
      { name: "#{prefix}_interests", id_name: :interest_id }, 
      { name: "#{prefix}_strengths", id_name: :strength_id}
    ].each do |relation| 
      validate_qualities_size(record, relation)
      validate_unique_qualities(record, relation)
    end
  end

  def validate_qualities_size(record, relation)
    must_have_size = get_relation_items(record, relation, true).size
    can_have_size = get_relation_items(record, relation, false).size

    record.errors.add(
      relation[:name], 
      I18n.t('validators.qualities.must_have')
    ) if must_have_size < MUST_HAVE_MIN || must_have_size > MUST_HAVE_MAX

    record.errors.add(
      relation[:name], 
      I18n.t('validators.qualities.can_have')
    ) if CAN_HAVE_MAX > 5
  end

  def validate_unique_qualities(record, relation)
    must_have_items_ids = get_relation_items(record, relation, true)
      .map(&relation[:id_name])

    can_have_items_ids = get_relation_items(record, relation, false)
      .map(&relation[:id_name])

    record.errors.add(
      relation[:name],
      I18n.t('validators.qualities.unique')
    ) unless (must_have_items_ids & can_have_items_ids).empty?
  end

  private

  def get_relation_items(record, relation, must_have)
    record.send(relation[:name]).select do |j| 
      must_have_check = must_have ? j.must_have? : !j.must_have?
      must_have_check && !j.marked_for_destruction?
    end
  end
end