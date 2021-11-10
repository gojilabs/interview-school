require 'test_helper'

class SubjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @subject = create(:subject)
  end

  test 'should get index' do
    get subjects_url
    assert_response :success
  end

  test 'should get new' do
    get new_subject_url
    assert_response :success
  end

  test 'should create subject' do
    assert_difference('Subject.count') do
      post subjects_url, params: {subject: {description: @subject.description, name: @subject.name}}
    end

    assert_redirected_to subject_url(Subject.last)
  end

  test 'should show subject' do
    get subject_url(@subject)
    assert_response :success
  end

  test 'should get edit' do
    get edit_subject_url(@subject)
    assert_response :success
  end

  test 'should update subject' do
    patch subject_url(@subject), params: {subject: {description: @subject.description, name: @subject.name}}
    assert_redirected_to subject_url(@subject)
  end

  test 'should destroy subject' do
    assert_difference('Subject.count', -1) do
      delete subject_url(@subject)
    end

    assert_redirected_to subjects_url
  end

  test 'should add teachers on create' do
    english_teacher = create(:teacher, :english)
    post subjects_url, params: {subject: {description: @subject.description, name: @subject.name, teacher_ids: [english_teacher.id]}}
    subject = Subject.last
    assert_redirected_to subject_url(subject)
    assert_equal 1, subject.teachers.size
    assert_equal english_teacher, subject.teachers.last
  end

  test 'should clear teachers on update' do
    create(:teacher_subject, :math_teacher_math, subject: @subject)
    refute_equal 0, @subject.teachers.size
    patch subject_url(@subject), params: {subject: {teacher_ids: []}}
    assert_redirected_to subject_url(@subject)
    assert_equal 0, @subject.teachers.size
  end

  test 'should update teachers on update' do
    math_subject = create(:subject, :math)
    english_teacher = create(:teacher, :english)
    patch subject_url(math_subject), params: {subject: {teacher_ids: [english_teacher.id]}}
    assert_redirected_to subject_url(math_subject)
    assert_equal [english_teacher], math_subject.teachers
  end
end
