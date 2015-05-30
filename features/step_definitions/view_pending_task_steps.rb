email = 'test@gmail.com'
password = '12345678'
password_confirmation = '12345678'
role_id='2'
project_role_id='1'
code='test'



Given(/^I am signed in as a manager or team member$/) do
  @user=User.new(id: 1, email:email, role_id:role_id)
  @user.save!
  visit root_path
end

Then(/^I can go to home page$/) do
  visit root_path
  page.all('').count.should == 1
end

Then(/^I should see my pending task in home page$/) do
  visit root_path
end

Then(/^I should see the button to go to document page$/) do

  visit projects_path
end

Then(/^I can go to a document page$/) do

end

When(/^I click the button to view document$/) do
  pending # express the regexp above with the code you wish you had
end
