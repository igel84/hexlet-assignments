# frozen_string_literal: true

require 'date'

class ExecutionTimer
    def initialize(app)
      @app = app
    end
  
    def call(env)
      start_time = DateTime.now.strftime('%Q').to_i
      status, headers, body = @app.call(env)
      request = Rack::Request.new(env)
      request_time = DateTime.now.strftime('%Q').to_i - start_time
      headers['X-REQUEST-TIME'] = request_time.to_s
      [status, headers, body]
    end
  end
  