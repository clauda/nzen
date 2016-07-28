module SeoHelper

  # Add metatags on head.
  # Usage:
  #   <% seo [
  #     { property: 'description', content: nil },
  #   ] %>
  # on views.
  # description metatags has default values on holoteca.yml.
  def seo(metatags)
    metatags.map do |meta|
      metatag meta[:property], meta[:content], (meta[:type] || 'name')
    end
  end

  def metatag(property, content = nil, type = 'name')
    default = content ? content : ''
    content_for :metatags do
      raw "   <meta #{type}='#{property}' content='#{default}' /> \n"
    end
  end

  def title(page_title)
    content_for(:title) { "#{page_title} no " }
  end

  def url(*paths, **options)
    paths[0] = paths.first[1..-1] if paths.first && paths.first[0] == '/'
    ["http://nzen.com.br", *paths].join('/')
  end

end
