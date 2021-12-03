require 'rails_helper'

RSpec.describe 'In categories page', type: :feature do
  before(:all) do
    @user = User.create({ name: 'Foo', email: 'user1@mail.com', password: '111111' })
    @group = Group.create({ name: 'Transport', icon: 'https://lorempixel.com/100/100/transport/', user_id: @user.id })
    @entity = Entity.create({ name: '001 Transaction', amount: 10, user_id: @user.id })
    # visit '/users/sign_in'
    # fill_in 'user_email', with: @user.email
    # fill_in 'user_password', with: @user.password
    # click_on 'Log in'
  end

  describe 'I can see' do
    it 'That is not transactions' do
      visit '/users/sign_in'
      fill_in "user_email", with: 'user1@mail.com'
      fill_in "user_password", with: '111111'
      click_on 'Log in'
      visit '/entities/1'
      expect(page).to have_content('No transactions found in this category')
    end

    it 'the back button' do
      visit '/users/sign_in'
      expect(page).to have_link('<')
    end

  end

end