module DealsHelper
  def theme_city_to_display
    @deal.advertiser.publisher.theme =~ /^entertainment-(.+)/
    case $1
    when 'pdx'
      'Portland'
    when 'new-york'
      'New York'
    else
      $1.capitalize
    end
  end
end