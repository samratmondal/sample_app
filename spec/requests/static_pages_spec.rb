require 'spec_helper'

describe "StaticPages" do
  describe "GET /static_pages" do
  	
  	let(:base_title) { "Ruby on Rails Tutorial Sample App" }

    describe "Home Page" do
      it "Should have content 'Sample App'" do
      	# Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      	#get static_pages_index_path
      	visit '/static_pages/home'
      	page.should have_content('Sample App')
      	#response.status.should be(200)
      end

      it "Should have the base title" do
      	visit '/static_pages/home'
      	page.should have_selector('title', :text => "#{base_title}")
      end

      it "Should not have the title 'Home'" do
        visit '/static_pages/home'
        page.should_not have_selector('title', :text => "| Home")
      end
    end

  	describe "Help Page" do
      it "Should have content 'Help'" do
      	visit '/static_pages/help'
      	page.should have_content('Help')
      end

      it "Should have the title 'Help'" do
      	visit '/static_pages/help'
      	page.should have_selector('title', :text => "#{base_title} | Help")
      end
    end

    describe "About Page" do
      it "Should have content 'About'" do
      	visit '/static_pages/about'
      	page.should have_content('About')
      end

      it "Should have the title 'About'" do
      	visit '/static_pages/about'
      	page.should have_selector('title', :text => "#{base_title} | About")
      end
    end

    describe "Contact Page" do
      it "Should have content 'Contact'" do
        visit '/static_pages/contact'
        page.should have_content('Contact')
      end

      it "Should have the title 'Contact'" do
        visit '/static_pages/contact'
        page.should have_selector('title', :text => "#{base_title} | Contact")
      end
    end

  end
end
