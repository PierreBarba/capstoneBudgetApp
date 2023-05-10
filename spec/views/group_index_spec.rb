require 'rails_helper'

RSpec.describe 'groups/index', type: :feature do
  include Warden::Test::Helpers

  before do
    @user = User.create(name: 'pierre', email: 'magpe02@hotmail.com', password: '12345678',
                        password_confirmation: '12345678')
    @user.skip_confirmation!
    @user.save
    login_as(@user, scope: :user)
    @group = Group.create(name: 'clothes', icon: 'clothes.png', user: @user)
    @entity = Entity.create(user: @user, name: 't-shirt', amount: 4.0)
    visit groups_path
  end

  it 'displays App name' do
    expect(page).to have_content('CATEGORIES')
  end

  it 'displays user name' do
    expect(page).to have_content(@group.name)
  end

  it 'displays sign in as' do
    expect(page).to have_content(@group.updated_at.strftime('%d %b %Y'))
  end

  it 'displays a sign out button' do
    expect(page).to have_link('ADD CATEGORY', href: new_group_path)
  end
end
