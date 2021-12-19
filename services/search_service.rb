class SearchService < BaseService

  def resource
    Resources::V1::SearchResponse
  end

  def payload
    { result: Resources::V1::SearchRequest.new(request.params).query }
  end
end
