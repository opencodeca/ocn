require 'uri'

class HttpValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    begin
      uri = URI.parse(value)
    rescue URI::InvalidURIError
      uri = false
    end

    unless uri.kind_of?(URI::HTTP) || uri.kind_of?(URI::HTTPS)
      record.errors[attribute] << 'URL invalide'
    end
  end
end
