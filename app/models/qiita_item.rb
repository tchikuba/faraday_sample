require 'json'

class QiitaItem
  def self.get

    url = 'https://qiita.com'
    connection = Faraday.new(url: url)
    response = connection.get do |req|
      req.url '/api/v2/items', page: 1, per_page: 100, query: 'tag:Rails updated:>2019-02 stocks:>3'
    end

    json = JSON.parse(response.body)
    json.sort_by { |i| i['likes_count']}.reverse.map do |item|
      { title: item['title'], url: item['url'], likes_count: item['likes_count'] }
    end.take(20)
  end
end
