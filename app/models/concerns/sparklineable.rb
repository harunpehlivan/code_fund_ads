module Sparklineable
  extend ActiveSupport::Concern

  def sparkline_impressions(start_date, end_date)
    key = "#{cache_key}/#{__method__}/#{start_date&.cache_key}-#{end_date&.cache_key}"
    Rails.cache.fetch(key) {
      date_range = (start_date..end_date).to_a
      date_range.map do |date|
        {
          name: "Impressions",
          date: date.to_s("%F"),
          value: daily_impressions_count(date),
        }
      end
    }
  end

  def sparkline_clicks(start_date, end_date)
    key = "#{cache_key}/#{__method__}/#{start_date&.cache_key}-#{end_date&.cache_key}"
    Rails.cache.fetch(key) {
      date_range = (start_date..end_date).to_a
      date_range.map do |date|
        {
          name: "Clicks",
          date: date.to_s("%F"),
          value: daily_clicks_count(date),
        }
      end
    }
  end
end
