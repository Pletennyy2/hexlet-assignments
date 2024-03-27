require 'test_helper'

class BulletinsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get bulletins_url
    assert_response :success
  end

  test 'should show bulletin' do
    bulletin = Bulletin.create(title: 'Test Bulletin', body: 'This is a test bulletin')

    get bulletin_url(bulletin)
    assert_response :success
    assert_select 'h5', text: 'Test Bulletin'
    assert_select 'p', text: 'This is a test bulletin'
  end
end
