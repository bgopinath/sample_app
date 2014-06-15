require 'spec_helper'


describe "StaticPages" do
	subject { page }
	describe "Home page" do
		before(:each) do
			visit root_path
		end
		
		it "should have the h1 content 'Sample App'" do
			page.should have_selector('h1', :text => 'Sample App')
		end
		
		it "should have the base title" do
			page.should have_selector('title', :text => full_title(''))
		end

		it "should not have a custom page title" do
			page.should_not have_selector('title', :text => "| Home")
		end
	end

	describe "Help page" do
		before(:each) do
			visit help_path
		end

		it "should have the h1 content 'Help'" do
			should have_selector('h1', :text => 'Help')
		end

		it "should have the title 'Help'" do
			should have_selector('title', :text => full_title("Help"))
		end
	end

	describe "About page" do
		before(:each) do
			visit about_path
		end

		it "should have the h1 content 'About Us'" do
			should have_selector('h1', :text => 'About Us')
		end

		it "should have the title 'About Us'" do
			should have_selector('title', :text => full_title("About Us"))
		end
	end

	describe "Contact page" do
		before(:each) do
			visit contact_path
		end

		it "should have the h1 content 'Contact'" do
			should have_selector('h1', :text => 'Contact')
		end

		it "should have the title 'Contact'" do
			should have_selector('title', :text => full_title("Contact"))
		end
	end
end
