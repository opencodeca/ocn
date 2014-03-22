# enhance Bourgeois to support Markdown
class Bourgeois::Presenter
  def markdown
    @renderer ||= Redcarpet::Render::HTML.new(filter_html: true, no_styles: true, no_images: true, safe_links_only: true, prettify: true)
    @markdown ||= Redcarpet::Markdown.new(@renderer, autolink: true, tables: true, footnotes: false)
  end

  def to_md(text)
    self.markdown.render(text).html_safe
  end
end