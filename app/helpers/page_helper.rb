module PageHelper
  def page_title(base: '', separator: '|')
    if content_for?(:page_title)
      "#{content_for(:page_title)} #{separator} #{base}".html_safe
    else
      base
    end
  end
end
