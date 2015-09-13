require 'rails_helper'

feature "User edits a sketch", js: true do

  scenario "successfully" do

    user = create(:user)
    sketch = create(:sketch, user: user)
    login_as(user, scope: :user)

    visit sketches_index_path(user.username)
    expect(page).to have_content(sketch.body)

    click_link (user.username + "/" + sketch.slug)

    expect(current_path).to eq sketch_edit_path(user.username, sketch.slug)

    expect(page).to have_content("Title")
    expect(page).to have_button("Save Sketch")

    fill_in "Title", with: "An edited sketch"
    fill_in_editor_field "puts 'edited sketch'"

    expect(page).to have_editor_display text: "puts 'edited sketch'"

    click_button "Save Sketch"

    expect(current_path).to eq sketches_index_path(user.username)
    expect(page).to have_content "An edited sketch"
    expect(page).to have_editor_display text: "puts 'edited sketch'"
    expect(page).to have_content "You currently have 1 sketch"

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
