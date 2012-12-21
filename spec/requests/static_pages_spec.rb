require 'spec_helper'

describe "StaticPages" do
  describe "GET /static_pages" do
  	
  	describe "Home Page" do
      it "Should have content 'Sample App'" do
      	# Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      	#get static_pages_index_path
      	visit '/static_pages/home'
      	page.should have_content('Sample App')
      	#response.status.should be(200)
      end

      it "Should have the title 'Home'" do
      	visit '/static_pages/home'
      	page.should have_selector('title',
      		:text => "Ruby on Rails Tutorial Sample App | Home")
      end
    end

  	describe "Help Page" do
      it "Should have content 'Help'" do
      	# Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      	#get static_pages_index_path
      	visit '/static_pages/help'
      	page.should have_content('Help')
      	#response.status.should be(200)
      end

      it "Should have the title 'Help'" do
      	visit '/static_pages/help'
      	page.should have_selector('title',
      		:text => "Ruby on Rails Tutorial Sample App | Help")
      end
    end

    describe "About Page" do
      it "Should have content 'About'" do
      	visit '/static_pages/about'
      	page.should have_content('About')
      end

      it "Should have the title 'About'" do
      	visit '/static_pages/about'
      	page.should have_selector('title',
      		:text => "Ruby on Rails Tutorial Sample App | About")
      end
    end

  end
end
