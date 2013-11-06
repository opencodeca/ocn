class PostValidator < ActiveModel::Validator
  def initialize(options)
    options.reverse_merge!(message: :invalid_post)
    super
  end

  def validate(record)
    if record.url.blank? && record.description.blank?
      record.errors.add(:base, options.fetch(:message))
    end
  end
end
