class Link < ActiveRecord::Base
  scope :newest, lambda { |count=10| order('created_at DESC').limit(count) }
end
