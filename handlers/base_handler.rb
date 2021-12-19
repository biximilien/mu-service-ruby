# TODO: rename to service?
class BaseHandler

  attr_reader :request, :response

  def initialize(request, response)
    @request = request
    @response = response
  end

  def logic
    nil
  end

  def handle()
    set_content_type_header
    logic
    encode_response
  end

  protected

  def resource
    nil
  end

  def payload
    {}
  end

  def set_content_type_header
    response['Content-Type'] = 'application/json'
  end

  def encode_response
    if resource.nil?
      Oj.dump(payload)
    elsif resource.respond_to?(:encode_json)
      resource.encode_json(resource.new(payload))
    end
  end

end
