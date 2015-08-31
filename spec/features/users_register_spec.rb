require 'rails_helper'

feature "User registers" do

  scenario "with valid details" do

    visit "/"

    # TDD TODO
    # this link has not been created yet.

    click_link "Register"
    expect(current_path).to eq(new_user_registration_path)

    fill_in "Name", with: "John Jacob"
    fill_in "Email", with: "tester@example.tld"
    fill_in "Password", with: "test-password"
    fill_in "Password confirmation", with: "test-password"
    click_button "Sign up"

    expect(current_path).to eq "/"
    expect(page).to have_content(
                        "A message with a confirmation link has been sent to your email address.
      Please follow the link to activate your account."
                    )

    open_email "tester@example.tld", with_subject: "Confirmation instructions"
    visit_in_email "Confirm my account"

    expect(current_path).to eq new_user_session_path
    expect(page).to have_content "Your email address has been successfully confirmed."

    fill_in "Email", with: "tester@example.tld"
    fill_in "Password", with: "test-password"
    click_button "Log in"

    # need some specs here with what the user will login to. Perhaps a login page with the user
    # profile and saved code should be tested here

  end
end
