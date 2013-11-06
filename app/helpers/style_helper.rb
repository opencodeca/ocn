module StyleHelper
  def navigation_class(section)
    'active' if content_for(:current_section).try(:to_sym) == section
  end
end
