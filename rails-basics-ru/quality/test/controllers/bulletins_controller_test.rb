# frozen_string_literal: true

require 'test_helper'

class BulletinsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bulletin = bulletins(:one)
  end

  test 'should get index' do
    get bulletins_url
    assert_response :success
  end

  test 'should get show' do
    get bulletin_url(@bulletin)
    assert_response :success
  end
end
