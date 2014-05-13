module DealsHelper

  def cache_key_for_deals
    d_count          = Deal.count
    d_max_updated_at = Deal.maximum(:updated_at).try(:utc).try(:to_s, :number)
    a_count          = Advertiser.count
    a_max_updated_at = Advertiser.maximum(:updated_at).try(:utc).try(:to_s, :number)
    p_count          = Publisher.count
    p_max_updated_at = Publisher.maximum(:updated_at).try(:utc).try(:to_s, :number)    
    "products/all-#{d_count}-#{d_max_updated_at}-#{a_count}-#{a_max_updated_at}-#{p_count}-#{p_max_updated_at}"
  end
  
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