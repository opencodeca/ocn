require 'uri'

class HttpValidator < ActiveModel::EachValidator
  def initialize(options)
    options.reverse_merge!(message: :invalid_url)
    super
  end

  def validate_each(record, attribute, value)
    begin
      uri = URI.parse(value)
    rescue URI::InvalidURIError
      uri = false
    end

    unless uri.kind_of?(URI::HTTP) || uri.kind_of?(URI::HTTPS)
      record.errors.add(attribute, options.fetch(:message), value: value)
    end
  end
end
