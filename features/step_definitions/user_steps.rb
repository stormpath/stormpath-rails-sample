When /^existing user$/ do
  @user = FactoryGirl.create(:user)
end

When /^I update user$/ do
  FactoryGirl.attributes_for(:another_user).each { |k, v| fill_in k.to_s.humanize, with: v }
  click_on "Update User"
end

When /^I update user without email$/ do
  FactoryGirl.attributes_for(:another_user).except(:email).each { |k, v| fill_in k.to_s.humanize, with: v }
  fill_in "Email", with: ""
  click_on "Update User"
end

When /^I create user$/ do
  FactoryGirl.attributes_for(:user).each { |k, v| fill_in k.to_s.humanize, with: v }
  click_on "Create User"
end

When /^I create user without email$/ do
  FactoryGirl.attributes_for(:user).except(:email).each { |k, v| fill_in k.to_s.humanize, with: v }
  click_on "Create User"
end

When /^I delete user$/ do
  click_on "Destroy"
end

Then /^I should see no user$/ do
  FactoryGirl.attributes_for(:user).except(:password).each {|k, v| page.should have_no_content(v) }
end

Then /^I should see user details$/ do
  FactoryGirl.attributes_for(:user).except(:password).each {|k, v| page.should have_content(v) }
end

Then /^I should see updated user details$/ do
  FactoryGirl.attributes_for(:another_user).except(:password).each {|k, v| page.should have_content(v) }
end

Then /^I should see form error$/ do
  page.should have_selector("form p.errors")
end