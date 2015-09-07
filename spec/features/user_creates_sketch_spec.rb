require 'rails_helper'

feature "User creates a sketch" do

  scenario "successfully" do

    user = create(:user)
    login_as(user, scope: :user)

    visit new_sketch_path(user)

    expect(page).to have_content("Title")
    expect(page).to have_button("Save Sketch")

    fill_in "Title", with: "A new sketch"
    fill_in "input_value", with: "puts 'new sketch'"

    expect(page).to have_content "puts 'new sketch'"

    click_button "Save Sketch"

    expect(current_path).to eq sketches_index_path(user.username)
    expect(page).to have_content "A new sketch"
    expect(page).to have_content "puts 'new sketch'"
    expect(page).to have_content "You currently have 1 sketch"

  end
end
