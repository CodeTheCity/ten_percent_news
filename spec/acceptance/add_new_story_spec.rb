require 'spec_helper'

describe 'Reading page' do
  before :each do
    visit '/stories/new'

    expect(Story.count).to eql(0)

    fill_in 'story[title]', :with => 'My new story'
    click_button('Add')
  end

  after :each do
    Story.destroy_all
  end

  it "adds a new story" do
    expect(Story.count).to eql(1)
  end

  context 'new story' do
    before :each do
      @story = Story.first
    end

    it "has a title" do
      expect(@story.title).to eql('My new story')
    end
  end
end
