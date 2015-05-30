email = 'test@gmail.com'
password = '12345678'
password_confirmation = '12345678'
role_id='2'
project_role_id='1'
code='test'



Given(/^I am a Manager$/) do
  @user=User.new(id: 1, email:email, role_id:role_id)
  @user.save!
end

Given(/^I am signed in$/) do
  visit root_path
=begin
  visit root_path
  expect(page).to have_content "Sign in"
  click_link 'Sign in'
  expect(current_path).to eq new_user_session_path
  visit '/users/sign_in'
  fill_in 'Email', with: email
  fill_in 'Password', with: password
  click_button 'Log in'
=end

end

Then(/^I can go to project page and should see a button for new project$/) do

  visit projects_path
  expect(page).to have_content "New Project"

end

When(/^I click the button for the new project$/) do
  ProjectRole.create(id: 1, rolename:'Project Manager')
  click_link 'New Project'

end

Then(/^I should see a form to add a project$/) do
  expect(current_path).to eq new_project_path
  fill_in "project[projectcode]", with: 'test project'
  fill_in "project[description]", with: 'test description'
  PmbokDoc.create(id: 2, name:'Project Management Plan')
  PmbokDoc.create(id: 3, name:'Activity Resource Requirements')
  PmbokDoc.create(id: 4, name:'Human Resources Management Plan')
  PmbokDoc.create(id: 5, name:'Project Staff Assignments')
  PmbokDoc.create(id: 6, name:'Project Management Plan')
  PmbokDoc.create(id: 7, name:'Resource Calendars')
  PmbokDoc.create(id: 8, name:'Team Performance Assessments')
  ProjectDocument.create(id: 1, pmbok_doc_id: 1, project_id: 1, docname: 'Project Management Plan')

end

When(/^I submit the form$/) do
  click_button 'Submit'

end

Then(/^I should see the details of my project$/) do
  expect(page).to have_content "test project"
end

Then(/^I should see the link to edit my project$/) do
  page.all('a > span.glyphicon-pencil')[0].click
end