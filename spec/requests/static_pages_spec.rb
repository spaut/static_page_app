require 'spec_helper'

describe "Static pages" do

  subject { page }

  shared_examples_for "all static pages" do
    it { should have_selector('h1',    text: heading) }
    it { should have_selector('title', text: full_title(page_title)) }
  end

  it "should have the right links on the layout" do
    # if they work on root path, they should work everywhere b/c shared
    visit root_path
    click_link "About"
    page.should have_selector 'title', text: full_title('About')
    click_link "Contact"
    page.should have_selector 'title', text: full_title('Contact')
    click_link "Help"
    page.should have_selector 'title', text: full_title('Help')
    click_link "sample app"
    page.should have_selector 'title', text: full_title('')
    click_link "Sign up now!"
    page.should have_selector 'title', text: full_title('Sign up')
  end

  describe "Home page" do
    before { visit root_path }
    let(:heading)    { 'Sample App' }
    let(:page_title) { '' }

    it_should_behave_like "all static pages"
    it { should_not have_selector 'title', text: '| Home' }
  end

  describe "About page" do
    before {visit about_path}
    let(:heading)    { 'About' }
    let(:page_title) { 'About' }

    it_should_behave_like "all static pages"
  end

  describe "Help" do
    before {visit help_path}
    let(:heading)    { 'Help' }
    let(:page_title) { 'Help' }

    it_should_behave_like "all static pages"
  end

  describe "Contact" do
    before {visit contact_path}
    let(:heading)    { 'Contact' }
    let(:page_title) { 'Contact' }

    it_should_behave_like "all static pages"
  end
end
