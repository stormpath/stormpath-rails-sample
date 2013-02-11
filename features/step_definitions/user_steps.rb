Given /^I am logged in$/ do
  step "existing user"
  step "I go to the new user session page"
  step "I sign in with username and password"
  step "I should sign in successfully"
end

When /^I sign in with username and password$/ do
  fill_in "Username", with: @user.username
  fill_in "Password", with: FactoryGirl.attributes_for(:user)[:password]
  within "#new_user" do
    click_on "Sign in"
  end
end

When /^I sign in with incorrect username and password$/ do
  fill_in "Username", with: "invalid name"
  fill_in "Password", with: "invalid pass"
  within "#new_user" do
    click_on "Sign in"
  end
end

When /^I submit user email$/ do
  fill_in "Email", with: @user.email
  click_on "Send me reset password instructions"
end

When /^I submit empty email$/ do
  fill_in "Email", with: ""
  click_on "Send me reset password instructions"
end

Then "I should see email validation error" do
  page.should have_content("Email name cannot be null/empty")
end

Then "I should see that password reset email sent" do
  page.should have_content("You will receive an email with instructions about how to reset your password in a few minutes.")
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

When /^user with real email$/ do
  @user = FactoryGirl.create(:user, email: "alterdenis@gmail.com")
end

When /^a (.*) user$/ do |status|
  @user = FactoryGirl.create(:user, status: status)
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

Then /^I should see failed sign in$/ do
  page.should have_content("Invalid email or password")
end
