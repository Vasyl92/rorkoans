require 'spec_helper'


# тест 1 створення  контролера Pages із представленнями index about info contact
describe "Rails Structure" do

  describe "Controller creating" do
    it 'You should Create Controller Pages with views index about info contact!!!' do
    	expect(PagesController).to be
    	get 'pages/about'
    	response.should be_success
     	get 'pages/index'
     	response.should be_success
    	get 'pages/contact'
    	response.should be_success
        get 'pages/info'
        response.should be_success
    end
  end
end
# тест 2 встановити root(коренева сторінка) pages/index.html.erb і видалити public/index.html
describe "Rails Structure" do

  describe "Please write root_path" do
    it 'You should write root_path to pages/index and remove public/index.html' do
    	visit root_path
    end
  end
end