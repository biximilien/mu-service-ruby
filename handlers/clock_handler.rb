class ClockHandler < BaseHandler

  def resource
    ::Resources::V1::Clock
  end

  def payload
    { timestamp: Time.now.to_i }
  end
end
