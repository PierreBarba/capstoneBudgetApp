require 'rails_helper'

RSpec.describe Group, type: :model do
  before(:each) do
    @user = User.create(id: 1, name: 'pierre', email: 'magpe02@hotmail.com', encrypted_password: '12345678')
    @group = Group.create(name: 'clothes', icon: 'clothes.png', user_id: @user.id)
  end

  context 'Testing validations' do
    it 'Should have a name' do
      expect(@group.name).to be_present
    end

    it 'Should have an icon' do
      expect(@group.icon).to be_present
    end

    it 'Should have a user' do
      expect(@group.user_id).to be_present
    end
  end

  context 'Testing associations' do
    it 'Should belong to a user' do
      @group =Group.reflect_on_association(:user)
      expect(@group.macro).to eq(:belongs_to)
    end

    it 'Should have and many and belongs to movements' do
      @group = Group.reflect_on_association(:entities)
      expect(@group.macro).to eq(:has_and_belongs_to_many)
    end
  end
end