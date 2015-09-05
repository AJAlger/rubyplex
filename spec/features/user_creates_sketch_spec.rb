require 'rails_helper'

feature "User creates a sketch" do

  scenario "successfully" do

    user = create(:user)
    login_as(user, scope: :user)

    visit new_sketch_path(user)

    expect(page).to have_content("Title")
    expect(page).to have_button("Save Sketch")

    fill_in "Title", with: "A new sketch"
    fill_in

    expect(page).to have_content "puts 'hello'"

    click_button "Save Sketch"

    expect(current_path).to eq sketches_path
    expect(page).to have_content "A new sketch"
    expect(page).to have_content "You have 1 sketch"

  end
end
