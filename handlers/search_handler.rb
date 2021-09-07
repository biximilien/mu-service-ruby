class SearchHandler < BaseHandler
  def to_json
    sr = Resources::V1::SearchRequest.new(@request.params)

    @response['Content-Type'] = 'application/json'
    resp = Resources::V1::SearchResponse.new(result: sr.query)
    Resources::V1::SearchResponse.encode_json(resp)
  rescue ArgumentError => e
    @response['Content-Type'] = 'application/json'
    resp = Resources::V1::SearchResponse.new(result: e.message)
    Resources::V1::SearchResponse.encode_json(resp)
  end
end
