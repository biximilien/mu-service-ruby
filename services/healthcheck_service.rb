class HealthcheckService < BaseService

  def resource
    ::Resources::V1::Healthcheck
  end

  def payload
    { status: 'ok' }
  end
end
