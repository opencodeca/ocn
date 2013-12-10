module LinkHelper
  def parse_links(text)
    text = text.dup
    Micky::URI.extract(text).each do |url|
      text.sub! url, link_to(url, url)
    end

    text
  end
end
