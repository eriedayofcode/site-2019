# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions

activate :livereload
activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end

# Layouts
# https://middlemanapp.com/basics/layouts/

# Per-page layout changes
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
page '/code-of-conduct.html', layout: 'legal'

# Proxy pages
# https://middlemanapp.com/advanced/dynamic-pages/

# proxy(
#   '/this-page-has-no-template.html',
#   '/template-file.html',
#   locals: {
#     which_fake_page: 'Rendering a fake page with a local variable'
#   },
# )

# Helpers
# Methods defined in the helpers block are available in templates
# https://middlemanapp.com/basics/helper-methods/

# helpers do
#   def some_helper
#     'Helping'
#   end
# end
helpers do
  def mailing_list_url
    "//eriedayofcode.us10.list-manage.com/subscribe/post" \
      "?u=3fcd98d64025f034a082fe384&id=bb907d9e18"
  end

  def cfp_url
    'https://docs.google.com/forms/d/e/1FAIpQLSec6u46Kq7HExShYdUTFjSy83rkaO_YU3AQFk9fFfFvgRqWag/viewform'
  end

  def tickets_url
    "https://eriedayofcode.ticketleap.com/2019/"
  end

  def venue_map_url
    "https://goo.gl/maps/Td9m3MVZgD62"
  end

  def twitter_profile(name)
    "https://twitter.com/#{name}"
  end

  def social_links
    OpenStruct.new(
      twitter: data.info.twitter_url,
      facebook: data.info.facebook_url,
      youtube: data.info.youtube_url
    )
  end

	def event_name
		"Erie Day of Code 2019 - Year 5"
	end

	def previous_years
		[2018, 2017, 2016, 2015]
	end

	def youtube_playlists_url
		"https://www.youtube.com/channel/UC0loXC7-ds3Ou_RfK1UoKbg/playlists"
	end

  def venue
    OpenStruct.new(
      name: 'Erie Art Museum',
      url: 'http://erieartmuseum.org',
      street: '411 State St.',
      address_line: 'Erie, PA 16501',
    )
  end

  def close_lodging
    data.lodging.select { |place| place.proximity == 'close' }
  end

  def further_lodging
    data.lodging.select { |place| place.proximity == 'far' }
  end

  def md_text(text)
    Kramdown::Document.new(text).to_html
  end
end



# Build-specific configuration
# https://middlemanapp.com/advanced/configuration/#environment-specific-settings

# configure :build do
#   activate :minify_css
#   activate :minify_javascript
# end
