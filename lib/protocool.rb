
module Protocool
  extend self

  def https
    use_ssl? ? 'https' : 'http'
  end

  def protocol
    "#{Protocool.https}://"
  end

  private

  def use_ssl?
    # Let the Rails config decide
    return true if Rails.respond_to?(:application) && Rails.application.config.force_ssl
    # Otherwise use default
    !Rails.env.development? && !Rails.env.test?
  end
end
