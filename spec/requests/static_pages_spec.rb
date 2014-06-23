require 'spec_helper'


describe "StaticPages" do
	subject { page }

	shared_examples_for "all static pages" do
		it "should have the right h1 content" do
			should have_selector('h1', :text => heading)
		end

		it "should have the right title" do
			should have_selector('title', :text => full_title(page_title))
		end
	end

	describe "Home page" do
		before(:each) do
			visit root_path
		end
		let(:heading) { 'Sample App'}
		let(:page_title) { '' }
		
		it_should_behave_like 'all static pages'

		it "should not have a custom page title" do
			page.should_not have_selector('title', :text => "| Home")
		end
	end

	describe "Help page" do
		before(:each) do
			visit help_path
		end
		let(:heading) { 'Help'}
		let(:page_title) { 'Help' }
		
		it_should_behave_like 'all static pages'
	end

	describe "About page" do
		before(:each) do
			visit about_path
		end
		
		let(:heading) { 'About Us'}
		let(:page_title) { 'About Us' }
		
		it_should_behave_like 'all static pages'
	end

	describe "Contact page" do
		before(:each) do
			visit contact_path
		end
		let(:heading) { 'Contact'}
		let(:page_title) { 'Contact' }
		
		it_should_behave_like 'all static pages'
	end

	it "should have the right links in the layout" do
		visit root_path
		click_link("About")
		should have_selector('title', text: full_title('About Us'))

		click_link('Help')
		should have_selector('title', text: full_title('Help'))

		click_link('Contact')
		should have_selector('title', text: full_title('Contact'))

		click_link('Home')
		should have_selector('title', text: full_title(''))

		click_link("sample app")
		should have_selector('title', text: full_title(''))

	end
end
