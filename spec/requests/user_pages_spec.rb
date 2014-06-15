require 'spec_helper'

describe "User pages" do
	subject { page }
	describe "signup page" do
		before(:each) do
			visit signup_path
		end
		
		it "should have the h1 content 'Sign Up'" do
			should have_selector('h1', :text => 'Sign Up')
		end

		it "should have the title 'Sign Up'" do
			should have_selector('title', :text => full_title("Sign Up"))
		end
	end

end
