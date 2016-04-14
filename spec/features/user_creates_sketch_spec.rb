require 'rails_helper'

feature "User creates a sketch", js: true do

  scenario "successfully" do

    user = create(:user)
    login_as(user, scope: :user)

    visit new_sketch_path

    expect(page).to have_content("Title")
    expect(page).to have_button("Save Sketch")

    fill_in "Title", with: "A new sketch"
    fill_in_editor_field "puts 'new sketch'"

    expect(page).to have_editor_display text: "puts 'new sketch'"

    click_button "Save Sketch"

    expect(page).to have_content "A new sketch"
    expect(page).to have_editor_display text: "puts 'new sketch'"
    expect(page).to have_content "You currently have 1 sketch"
    expect(current_path).to eq sketches_index_path(user.username)

  end

  private

  def fill_in_editor_field(text)
    find_ace_editor_field.set text
  end

  def find_ace_editor_field
    input_field_locator = ".ace_text-input"
    is_input_field_visible = false
    find(input_field_locator, visible: is_input_field_visible)
  end

  def have_editor_display(options)
    editor_display_locator = ".ace_content"
    have_css(editor_display_locator, options)
  end
end
