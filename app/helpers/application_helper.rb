module ApplicationHelper
    def flash_class(level)
        case level
            when :notice then "alert alert-info"
            when :success then "alert alert-success"
            when :error then "alert alert-error"
            when :alert then "alert alert-error"
        end
    end

    def markdown(text)
      @markdown ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML, {
        autolink: true,
        space_after_headers: true,
        fenced_code_blocks: true,
        underline: true,
        highlight: true,
        quote: true,
        footnotes: true,
        tables: true
        })
        @markdown.render(text).html_safe
      end
end
