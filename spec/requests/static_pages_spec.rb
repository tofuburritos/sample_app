require 'rails_helper'

describe "StaticPages" do

  describe "Home page" do
    it "should have the content 'Tofu Stationery'" do
      visit '/static_pages/home'
      expect(page).to have_content('Tofu Stationery')
    end
  end

  describe "Help" do
    it "should have the content 'Справка'" do
      visit '/static_pages/help'
      expect(page).to have_content('Справка')
    end
  end


end
