module ExternalMetadata
  extend ActiveSupport::Concern

  included do
    serialize :metadata, JSON
    before_create :save_metadata
  end

private

  def save_metadata
    self.metadata = MetadataFetcher.new(self.url)
  end

end
