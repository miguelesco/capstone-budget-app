require 'rails_helper'

RSpec.describe 'In categories page', type: :feature do
  before(:all) do
    @user = User.create({ name: 'Foo', email: 'user1@mail.com', password: '111111' })
    @group = Group.create({ name: 'Transport', icon: 'https://lorempixel.com/100/100/transport/', user_id: @user.id })
    @entity = Entity.create({ name: '001 Transaction', amount: 10, user_id: @user.id })
  end

  describe 'I can see' do
    it 'the Add new category button' do
      visit '/users/sign_in'
      fill_in 'user_email', with: 'user1@mail.com'
      fill_in 'user_password', with: '111111'
      click_on 'Log in'
      visit '/group'
      expect(page).to have_button('Add New Category')
    end

    it 'the back button' do
      visit '/users/sign_in'
      # fill_in 'user_email', with: 'user1@mail.com'
      # fill_in 'user_password', with: '111111'
      # click_on 'Log in'
      expect(page).to have_link('<')
    end

    it 'All Categories:' do
      visit '/users/sign_in'
      fill_in 'user_email', with: 'user1@mail.com'
      fill_in 'user_password', with: '111111'
      click_on 'Log in'
      visit '/group'
      expect(page).to have_content('All Categories:')
    end
  end
end
