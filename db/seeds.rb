require "open-uri"
require "nokogiri"

Pub.destroy_all

url = "http://www.timeout.com/london/bars-and-pubs/the-100-best-bars-and-pubs-in-london"
html_file = open(url)
doc = Nokogiri::HTML(html_file)

doc.search(".feature-item").take(10).each do |bar|
  image_url = bar.search("img")[0].attr("src")
  name = bar.search("h3 a")[0].text
  address = bar.search(".listings_flag")[0].text.strip
  Pub.create!(name: name, address: address, image_url: image_url)
end
