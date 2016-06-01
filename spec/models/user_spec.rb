require 'rails_helper'

RSpec.describe User, type: :model do

  describe '#create' do
    it 'has a valid factory' do
      user = FactoryGirl.create(:user)
      expect(user.name).to eq('Test User')
      expect(user.email).to eq('test@example.com')
      expect(user.password.length).to be >(3)
    end

    it 'should NOT allow creation with out a name' do
      user = User.create(email: 'testuser@test.com', password: 'please123', password_confirmation: 'please123' )
      expect(user.errors.count).to eq(1)
    end

    describe '#set_default_role' do
      it 'should create a default role of customer' do
        user = FactoryGirl.build(:user)
        expect(user.role).to eq('customer')
      end
    end
  end

end
