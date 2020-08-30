require 'application_system_test_case'

class TeachersTest < ApplicationSystemTestCase
  setup do
    @teacher = teachers(:math_teacher)
  end

  test 'visiting the index' do
    visit teachers_url
    assert_selector 'h1', text: 'Teachers'
  end

  test 'creating a Teacher' do
    visit teachers_url
    click_on 'New Teacher'

    fill_in 'First name', with: @teacher.first_name
    fill_in 'Last name', with: @teacher.last_name
    click_on 'Create Teacher'

    assert_text 'Teacher was successfully created'
    click_on 'Back'
  end

  test 'updating a Teacher' do
    visit teachers_url
    click_on 'Edit', match: :first

    fill_in 'First name', with: @teacher.first_name
    fill_in 'Last name', with: @teacher.last_name
    click_on 'Update Teacher'

    assert_text 'Teacher was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Teacher' do
    visit teachers_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Teacher was successfully destroyed'
  end

  test 'add new class' do
    teacher = teachers(:math_and_english_teacher)
    visit teacher_url(teacher)
    click_on 'Add new class'
    select subjects(:subject_without_teacher).name
    click_on 'Add'
    assert_text 'Class was successfully added'
  end

  test 'remove a class' do
    teacher = teachers(:math_and_english_teacher)
    teacher_subject = teacher_subjects(:math_and_english_teacher_math)
    visit teacher_url(teacher)
    within "#teacher-subject-#{teacher_subject.id}" do
      click_on 'Edit'
      page.accept_confirm do
        click_on 'Remove'
      end
    end
    assert_text 'Class was successfully removed'
  end

  test 'update a class' do
    teacher = teachers(:math_and_english_teacher)
    teacher_subject = teacher_subjects(:math_and_english_teacher_math)
    visit teacher_url(teacher)
    within "#teacher-subject-#{teacher_subject.id}" do
      click_on 'Edit'
      click_on 'Cancel'
      click_on 'Edit'
      fill_in 'teacher_subject_level', with: '2'
      click_on 'Update'
    end
    assert_text "#{teacher_subject.subject.name} (2)"
  end
end
