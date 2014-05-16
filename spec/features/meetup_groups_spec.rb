require 'spec_helper'

feature 'Show meetups' do
  before(:each) do
    @meetup_group = create(:meetup_group)
    sign_in @meetup_group.owner
  end

  scenario 'in index view' do
    visit meetup_groups_path

    expect(page).to have_content('Edit')
    expect(page).to have_content('Meetup Groups')
    expect(page).to have_content(@meetup_group.topic)
  end

  scenario 'in detail view' do
    visit meetup_group_path(@meetup_group)

    expect(page).to have_content('Add Activity')
    expect(page).to have_content('Add Member')
    expect(page).to have_content('Edit')
    expect(page).to have_content('Delete')
    expect(page).to have_content(@meetup_group.topic)
  end
end

feature 'User creates meetup group', js: true do
  before(:each) do
    sign_in
  end

  scenario 'from index view' do
    visit meetup_groups_path

    click_link 'Found a new meetup group'

    expect(page).to have_content('New Meetup Group')

    fill_in 'Topic', with: 'SomeTopic'
    fill_in 'Incepted at', with: '2019-02-01'
    fill_in 'Home town', with: 'Zurich'

    click_button 'Create Meetup group'

    expect(page).to have_content('Meetup group was successfully created.')
  end

end

