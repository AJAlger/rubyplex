require 'rails_helper'

feature "User deletes a sketch" do

  scenario "successfully" do

    user = create(:user)
    sketch = create(:sketch, user: user)
    login_as(user, scope: :user)

    visit sketches_index_path(user.username)

    expect(page).to have_content(sketch.body)
    click_link "delete-sketch"
    expect(page).to have_content "Your sketch has been deleted."
    expect(page).not_to have_content(sketch.body)

  end

end