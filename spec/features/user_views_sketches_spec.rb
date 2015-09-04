require 'rails_helper'

feature "User views his/her Sketches" do

  scenario "successfully" do

    user = create(:user)
    sketch_one = create(:sketch, user: user, title: "sketch one")
    sketch_two = create(:sketch, user: user, title: "sketch two")

    visit new_user_session_path

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"

    expect(current_path).to eq new_sketch_path
    expect(page).to have_content(user.name)
    expect(page).to have_button("Save Sketch")

    within ".dropdown" do
      click_link "Sketches"
    end

    expect(current_path).to eq sketches_path
    expect(page).to have_content "You have 2 sketches"
    expect(page).to have_link(sketch_one.title)
    expect(page).to have_link(sketch_two.title)

  end

end
