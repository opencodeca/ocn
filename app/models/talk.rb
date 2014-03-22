class Talk
  def self.for_username(username)
    response = api.get("/api/speakers/#{username}/talks")
    body = JSON.parse(response.body)

    if response.status == 200 && body.is_a?(Array)
      body.map { |t| OpenStruct.new(t) }
    else
      []
    end
  end

protected

  def self.api
    Faraday.new(url: 'http://opencode.ca') do |faraday|
      faraday.response :logger
      faraday.adapter  Faraday.default_adapter
    end
  end
end
