require 'test_helper'

class Teachers::TextbooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @teachers_textbook = teachers_textbooks(:one)
  end

  test 'should get index' do
    get teachers_textbooks_url
    assert_response :success
  end

  test 'should get new' do
    get new_teachers_textbook_url
    assert_response :success
  end

  test 'should create teachers_textbook' do
    assert_difference('Teachers::Textbook.count') do
      post teachers_textbooks_url, params: { teachers_textbook: {} }
    end

    assert_redirected_to teachers_textbook_url(Teachers::Textbook.last)
  end

  test 'should show teachers_textbook' do
    get teachers_textbook_url(@teachers_textbook)
    assert_response :success
  end

  test 'should get edit' do
    get edit_teachers_textbook_url(@teachers_textbook)
    assert_response :success
  end

  test 'should update teachers_textbook' do
    patch teachers_textbook_url(@teachers_textbook), params: { teachers_textbook: {} }
    assert_redirected_to teachers_textbook_url(@teachers_textbook)
  end

  test 'should destroy teachers_textbook' do
    assert_difference('Teachers::Textbook.count', -1) do
      delete teachers_textbook_url(@teachers_textbook)
    end

    assert_redirected_to teachers_textbooks_url
  end
end
