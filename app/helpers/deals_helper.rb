module DealsHelper
  def cache_key_for_deals
    count          = Deal.count
    max_updated_at = Deal.maximum(:updated_at).try(:utc).try(:to_s, :number)
    "products/all-#{count}-#{max_updated_at}"
  end
end