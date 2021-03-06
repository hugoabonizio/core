require "sanitize"

module SanitizeHelper
  DEFAULT_CONFIG = {
    :elements => [ "a", "b", "br", "hr", "u", "i", "ul", "li", "abbr", "p" ],
    :attributes => {
      "a" => ["href"],
    },
    :add_attributes => {
      "a" => {
        "rel" => "nofollow noopener",
        "target" => "_blank"
      }
    }
  }

  def html_sanitize(input)
    raw(Sanitize.fragment(input, DEFAULT_CONFIG))
  end

  def html_clean(input)
    Sanitize.clean(input)
  end
end
