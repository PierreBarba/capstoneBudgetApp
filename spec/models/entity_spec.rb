require 'rails_helper'

RSpec.describe Entity, type: :model do
  before(:each) do
    @user = User.create(id: 1, name: 'pierre', email: 'magpe02@hotmail.com', encrypted_password: '12345678')
    @entity = Entity.create(name: 'clothes', amount: 4.0, user_id: @user.id)
  end

  context 'Testing validations' do
    it 'Should have a name' do
      expect(@entity.name).to be_present
    end

    it 'Should have an amount' do
      expect(@entity.amount).to be_present
    end

    it 'Should have a valid amount' do
      expect(@entity.amount).to be >= 0
    end

    it 'movement amount should be decimal' do
      expect(@entity.amount).to be_a_kind_of(BigDecimal)
    end
   
    it 'Should have a user' do
      expect(@entity.user_id).to be_present
    end
  end

  context 'Testing associations' do
      it 'Should have and many and belongs to movements' do
      @entity = Entity.reflect_on_association(:groups)
      expect(@entity.macro).to eq(:has_and_belongs_to_many)
    end
  end
end
