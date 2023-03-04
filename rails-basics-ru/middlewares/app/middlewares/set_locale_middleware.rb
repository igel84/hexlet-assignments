# frozen_string_literal: true

class SetLocaleMiddleware
  def initialize(app)
    @app = app
  end

  # BEGIN
  def call(env)
    @status, @headers, @response = @app.call(env)

    I18n.locale = if @headers['HTTP_ACCEPT_LANGUAGE'].present?
                    @headers['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first.to_sym
                  else
                    request = Rack::Request.new(env)
                    if request.env['HTTP_ACCEPT_LANGUAGE'].present?
                      request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first.to_sym
                    else
                      I18n.default_locale
                    end
                  end
    
    [@status, @headers, @response]
  end
  # END
end
