class MetadataFetcher

  def initialize(url)
    @url = url
  end

  def as_json(*args)
    {
      title: document.title,
      description: document.description,
      sentences: document.sentences,
      body: document.body,
      html_body: document.html_body,
      keywords: document.keywords,
      author: document.author,
      datetime: document.datetime
    }
  end

private

  def document
    @document ||= Pismo::Document.new(@url)
  end
end
