require 'spec_helper'

describe "StaticPages" do
  describe "GET /static_pages" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get static_pages_home_path
      response.status.should be(200)
    end
  end

  describe "Home Page" do
    it "should have the content 'Baby Cloud'" do
      visit '/static_pages/home'
      expect(page).to have_content('Baby Cloud')
    end
  end

  describe "Navbar should be available" do
    it "should show the navigation on the home page" do
      visit '/static_pages/home'
      expect(page).to have_link('Sign In')
      expect(page).to have_link('Sign Up')
    end
  end
end
