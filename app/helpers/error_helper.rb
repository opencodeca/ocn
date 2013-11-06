module ErrorHelper
  def render_error_messages(record)
    if record.errors.any?
      render partial: 'shared/error_messages', locals: { record: record }
    end
  end
end
