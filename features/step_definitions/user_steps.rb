Given /^I am logged in$/ do
  step "existing user"
  step "I go to the new user session page"
  step "I sign in with username and password"
  step "I should sign in successfully"
end

When /^I sign in with username and password$/ do
  fill_in "Username", with: @user.username
  fill_in "Password", with: FactoryGirl.attributes_for(:user)[:password]
  within ".form-actions" do
    click_on "Sign in"
  end
end

When /^I sign in with incorrect username and password$/ do
  fill_in "Username", with: "invalid name"
  fill_in "Password", with: "invalid pass"
  within ".form-actions" do
    click_on "Sign in"
  end
end


Then /^I should see login error$/ do
  page.should have_content("Invalid email or password.")
end

Then /^I should sign in successfully$/ do
  page.should have_content("Signed in successfully.")
end

When /^existing user$/ do
  @user = FactoryGirl.create(:user)
end

When /^I update user$/ do
  @another_user_attributes = FactoryGirl.attributes_for(:another_user)
  @another_user_attributes.each { |k, v| fill_in k.to_s.humanize, with: v }
  click_on "Update User"
end

When /^I update user without email$/ do
  @another_user_attributes = FactoryGirl.attributes_for(:another_user)
  @another_user_attributes.except(:email).each { |k, v| fill_in k.to_s.humanize, with: v }
  fill_in "Email", with: ""
  click_on "Update User"
end

When /^I create user$/ do
  @user_attributes = FactoryGirl.attributes_for(:user)
  @user_attributes.each { |k, v| fill_in k.to_s.humanize, with: v }
  click_on "Create User"
end

When /^I create user without email$/ do
  @user_attributes = FactoryGirl.attributes_for(:user)
  @user_attributes.except(:email).each { |k, v| fill_in k.to_s.humanize, with: v }
  click_on "Create User"
end

When /^I delete user$/ do
  click_on "Destroy"
end

Then /^I should see no user$/ do
  @user.attributes.each {|k, v| page.should have_no_content(v) }
end

Then /^I should see user details$/ do
  @user_attributes ||= @user.attributes.except("updated_at", "created_at")
  @user_attributes.except(:password).each {|k, v| page.should have_content(v) }
end

Then /^I should see updated user details$/ do
  @another_user_attributes.except(:password).each {|k, v| page.should have_content(v) }
end

Then /^I should see form error$/ do
  page.should have_selector("form p.errors")
end