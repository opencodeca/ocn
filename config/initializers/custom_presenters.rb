# enhance Bourgeois to support Markdown
class Bourgeois::Presenter
  def markdown
    @renderer ||= Redcarpet::Render::HTML.new(filter_html: true, no_styles: true, no_images: true, safe_links_only: true, prettify: true)
    @markdown ||= Redcarpet::Markdown.new(@renderer, autolink: true, tables: true, footnotes: false)
  end

  def to_md(text)
    md = markdown.render(text)
    sanitize(md)
  end

  CONFIG = {
    :elements => %w[
      a b em i ul ol li p pre table tr th td
    ],

    :attributes => {
      'a' => ['href']
    },

    :add_attributes => {
      'a' => {'rel' => 'nofollow'}
    },

    :protocols => {
      'a' => {'href' => ['http', 'https', 'mailto', :relative]}
    }
  }

  def sanitize(text)
    Sanitize.clean(text, CONFIG).html_safe
  end
end
