
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
    # Allow the user to override any defaults
    # This is useful for booting a Rails app with production environment locally
    return false if ENV['PROTOCOOL_FORCE_INSECURE'] == 'true'
    # Let the Rails config decide
    return true if Rails.respond_to?(:application) && Rails.application.config.force_ssl
    # Otherwise use default
    !Rails.env.development? && !Rails.env.test?
  end
end
