require 'spec_helper'

describe "Static pages" do

  subject { page }

  shared_examples_for "all static pages" do
    it { should have_selector('h1',    text: heading) }
    it { should have_selector('title', text: full_title(page_title)) }
  end

  describe "Navigation" do
    before { visit root_path }

    it "should have the right links on the layout" do
      click_link "About" do
        let(:heading)    { 'About' }
        let(:page_title) { 'About Us' }

        it_should_behave_like "all static pages"
      end
      click_link "Help" do
        let(:heading)    { 'Help' }
        let(:page_title) { heading }

        it_should_behave_like "all static pages"
      end
      click_link "Contact" do
        let(:heading)    { 'Contact' }
        let(:page_title) { heading }

        it_should_behave_like "all static pages"
      end
      click_link "Home" do
        let(:heading)    { 'Sample App' }
        let(:page_title) { '' }

        it_should_behave_like "all static pages"
        it { should_not have_selector 'title', text: '| Home' }
      end
      click_link "sample app" do
        let(:heading)    { 'Sample App' }
        let(:page_title) { '' }

        it_should_behave_like "all static pages"
        it { should_not have_selector 'title', text: '| Home' }
      end
      click_link "Sign up now!" do
        let(:heading)    { 'Sign up' }
        let(:page_title) { heading }

        it_should_behave_like "all static pages"
      end
    end
  end

  describe "Home page" do
    before { visit root_path }

    let(:heading)    { 'Sample App' }
    let(:page_title) { '' }

    it_should_behave_like "all static pages"
    it { should_not have_selector 'title', text: '| Home' }
  end

  describe "Help page" do
    before { visit help_path }

    let(:heading)    { 'Help' }
    let(:page_title) { heading }

    it_should_behave_like "all static pages"
  end

  describe "About page" do
    before { visit about_path }

    let(:heading)    { 'About' }
    let(:page_title) { 'About Us' }

    it_should_behave_like "all static pages"
  end

  describe "Contact page" do
    before { visit contact_path }

    let(:heading)    { 'Contact' }
    let(:page_title) { heading }

    it_should_behave_like "all static pages"
  end
end
