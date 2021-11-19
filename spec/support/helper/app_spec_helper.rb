module Helper
  module AppSpec
    def capitalize(title)
      title.capitalize
    end

    def shorten_text(text)
      text.truncate(22)
    end
  end
end
