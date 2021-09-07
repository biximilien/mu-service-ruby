class BaseHandler
  def initialize(request, response)
    @request = request
    @response = response
  end

  def to_json
    {}.to_json
  end
end
