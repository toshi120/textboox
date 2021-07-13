require 'application_system_test_case'

class Teachers::TextbooksTest < ApplicationSystemTestCase
  setup do
    @teachers_textbook = teachers_textbooks(:one)
  end

  test 'visiting the index' do
    visit teachers_textbooks_url
    assert_selector 'h1', text: 'Teachers/Textbooks'
  end

  test 'creating a Textbook' do
    visit teachers_textbooks_url
    click_on 'New Teachers/Textbook'

    click_on 'Create Textbook'

    assert_text 'Textbook was successfully created'
    click_on 'Back'
  end

  test 'updating a Textbook' do
    visit teachers_textbooks_url
    click_on 'Edit', match: :first

    click_on 'Update Textbook'

    assert_text 'Textbook was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Textbook' do
    visit teachers_textbooks_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Textbook was successfully destroyed'
  end
end
