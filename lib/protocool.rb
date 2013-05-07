
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
    # *Possibly* add "test environment" as an exception as well.
    # But staging and production must really have SSL!
    !Rails.env.development?
  end
end
