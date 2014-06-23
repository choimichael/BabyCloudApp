require 'spec_helper'

describe "StaticPages" do
  describe "root static_pages#home" do
    it "success! (now write some real specs)" do
      visit '/'
      page.status_code.should be 200
    end
  end

  describe "Home Page" do
    it "should have the content 'Baby Cloud'" do
      visit '/'
      expect(page).to have_content('Baby Cloud')
    end
  end

  describe "Navbar should be available" do
    it "should show the navigation on the home page" do
      visit '/'
      expect(page).to have_link('Sign In')
      expect(page).to have_link('Sign Up')
    end
  end
end
