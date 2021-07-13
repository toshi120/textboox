require 'test_helper'

class Students::TextbooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @students_textbook = students_textbooks(:one)
  end

  test 'should get index' do
    get students_textbooks_url
    assert_response :success
  end

  test 'should get new' do
    get new_students_textbook_url
    assert_response :success
  end

  test 'should create students_textbook' do
    assert_difference('Students::Textbook.count') do
      post students_textbooks_url, params: { students_textbook: {} }
    end

    assert_redirected_to students_textbook_url(Students::Textbook.last)
  end

  test 'should show students_textbook' do
    get students_textbook_url(@students_textbook)
    assert_response :success
  end

  test 'should get edit' do
    get edit_students_textbook_url(@students_textbook)
    assert_response :success
  end

  test 'should update students_textbook' do
    patch students_textbook_url(@students_textbook), params: { students_textbook: {} }
    assert_redirected_to students_textbook_url(@students_textbook)
  end

  test 'should destroy students_textbook' do
    assert_difference('Students::Textbook.count', -1) do
      delete students_textbook_url(@students_textbook)
    end

    assert_redirected_to students_textbooks_url
  end
end
