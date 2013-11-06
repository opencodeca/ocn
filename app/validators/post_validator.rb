class PostValidator < ActiveModel::Validator
  def validate(record)
    if record.url.blank? && record.description.blank?
      record.errors[:url] << 'Vous devez saisir une URL ou une description'
    end
  end
end
