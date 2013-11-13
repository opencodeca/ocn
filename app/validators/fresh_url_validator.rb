class FreshUrlValidator < ActiveModel::EachValidator
  def initialize(options)
    options.reverse_merge!(message: :duplicated_url)
    super
  end

  def validate_each(record, attribute, value)
    freshness_range = 2.weeks.ago
    posts = record.class.where(url: record.url).where("created_at > ?", freshness_range)

    if posts.exists?
      record.errors.add(attribute, options.fetch(:message), value: value)
    end
  end
end
