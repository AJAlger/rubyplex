require 'rails_helper'

feature "User edits a sketch" do

  scenario "successfully" do

    user = create(:user)
    sketch = create(:sketch, user: user)
    login_as(user, scope: :user)

    visit sketches_index_path(user.username)
    expect(page).to have_content(sketch.body)

    click_link (user.username + "/" + sketch.slug)

    expect(current_path).to eq sketch_edit_path(user.username, sketch.slug)



  end

end
