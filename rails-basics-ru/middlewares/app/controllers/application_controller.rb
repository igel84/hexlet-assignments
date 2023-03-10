# frozen_string_literal: true

class ApplicationController < ActionController::Base
  around_action :switch_locale

  def switch_locale(&action)
    locale = extract_locale_from_accept_language_header
    I18n.with_locale(locale, &action)
  end
  
  private
    def extract_locale_from_accept_language_header
      if request.env['HTTP_ACCEPT_LANGUAGE'].present?
        request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
      else
        I18n.default_locale
      end
    end
end
