require 'spec_helper'

describe "Authentication" do

  subject { page }

  describe "signin page" do
    before { visit new_user_session_path }

    it { should have_selector('h3', text: 'Log in') }
  end

  describe "log in" do

  	describe "with valid information" do
  		before { visit new_user_session_path }
  		let(:user) { FactoryGirl.create(:user) }
  		before { log_in user}

  		it { should have_link('Create company', href: new_company_path) }

  	end
  end

end