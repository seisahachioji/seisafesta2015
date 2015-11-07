require "slim"

::Slim::Engine.set_options pretty: true, format: :html

activate :i18n, :mount_at_root => :ja
activate :relative_assets
set :relative_links, true

###
# Compass
###

# Change Compass configuration
compass_config do |config|
  config.output_style = :expanded
  config.line_comments = false
end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

page "/bower_components/**", :layout => nil

# Proxy pages (https://middlemanapp.com/advanced/dynamic_pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Reload the browser automatically whenever files change
# configure :development do
#   activate :livereload
# end

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript

  # Enable cache buster
  # activate :asset_hash

  # Use relative URLs
  # activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end

#after_build do |builder|
#  FileUtils.cp_r 'vendor/bower_components', 'build/'
#end

activate :contentful do |f|
  f.space = { Contentful: "culruq1g10hg" }
  f.access_token = "24f54b952d3cac385905cb76908d79be9228852c84081243ef33e37fc3327598"
  f.content_types = {
    Author: "4VE1fBoehaAqC0E4s8Scqm",
    News: "3TqDjvw4OkoEsQM0ek20Mq",
    MenuItem: "1JUTVk95g0osmMMW8mI6mk",
    Stage: "Fljcnbc48eWoiIoM0MIGU",
    Booth: '3WiIXjHOtaAw6YwaA4wc4Q',
    StaticPage: '1vjGoNSGP6eOsis8AGsCqm'
  }
end

ready do
  if contentful = data.try(:Contentful)
    contentful.Stage.try(:each) do |id, stage|
      proxy "/stage/#{stage.slug}.html", "stage/stage.html", :locals => { stage: stage }, ignore: true
    end

    contentful.Booth.try(:each) do |id, booth|
        proxy "/booth/#{booth.slug}.html", "booth/booth.html", :locals => { booth: booth }, ignore: true
    end

    contentful.News.try(:each) do |id, news|
      proxy "/article/#{news.slug}.html", "article/article.html", :locals => { article: news }, ignore: true
    end
  end
end

helpers do

  def get_static_pages
    pages = {}
    data.Contentful.StaticPage.each do |id, page|
      pages[page.type] = page
    end
    return pages
  end

  def get_static_page(key); get_static_pages[key]; end

  def article_url_for(prefix, id)
    idx = '/%s/index.html' % prefix
    url_for(idx, {:relative => true, :current_resource => current_resource}) + ('%s.html' % id)
  end

  def default_article_url_for(prefix, item)
    id = nil
    if item.key? 'slug'
      id = item.slug
    else
      id = item.title
    end
    article_url_for prefix, id
  end

  def stage_url_for(stage); default_article_url_for 'stage',   stage; end
  def news_url_for(news);   default_article_url_for 'article', news;  end
  def booth_url_for(booth); default_article_url_for 'booth',   booth; end

  def get_sorted_items(items, key)
    sortedKeys = items.keys.sort do |aKey, bKey|
      a = items[aKey]
      b = items[bKey]

      unless a[key] || b[key] then; next 0; end;

      if key == 'timestamp'
        next a[key].to_time.to_i <=> b[key].to_time.to_i
      else
        next a[key] <=> b[key]
      end
    end
    ret = []
    sortedKeys.each do |sKey|
      ret.push items[sKey]
    end
    return ret
  end

  def sorted_newses(); get_sorted_items(data.Contentful.News,  'timestamp').reverse; end;
  def sorted_booths(); get_sorted_items(data.Contentful.Booth,  'timestamp').reverse; end;
  def sorted_stages(); get_sorted_items(data.Contentful.Stage,  'timestamp').reverse; end;
  def sorted_navs();   get_sorted_items(data.Contentful.MenuItem, 'order'); end;

  def title(title = '')
    return data.static.title.global if title.blank?
    return '%s | %s' % [title, data.static.title.global]
  end

end
