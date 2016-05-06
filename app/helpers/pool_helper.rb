module PoolHelper
  def pool_errors_messages!
    return "" unless pool_errors_messages?

    messages = @pool.errors.messages.map { |msg| content_tag(:li, msg[1][0])}.join

    html = <<-HTML
      <div class="error">
        <ul>#{messages}</ul>
      </div>
    HTML

    html.html_safe
  end

  def pool_errors_messages?
    !@pool.nil?
  end
end
