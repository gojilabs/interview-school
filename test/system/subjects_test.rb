require 'application_system_test_case'

class SubjectsTest < ApplicationSystemTestCase
  setup do
    @subject = subjects(:math)
  end

  test 'visiting the index' do
    visit subjects_url
    assert_selector 'h1', text: 'Class'
  end

  test 'creating a Class' do
    visit subjects_url
    click_on 'New Class'

    fill_in 'Description', with: @subject.description
    fill_in 'Name', with: @subject.name
    click_on 'Create Class'

    assert_text 'Class was successfully created'
    click_on 'Back'
  end

  test 'updating a Class' do
    visit subjects_url
    click_on 'Edit', match: :first

    fill_in 'Description', with: @subject.description
    fill_in 'Name', with: @subject.name
    click_on 'Update Class'

    assert_text 'Class was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Class' do
    visit subjects_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Class was successfully destroyed'
  end
end
