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
# тест 3  Написати шлях під іменем about_path до сторінки about/index.html.erb 
describe "Rails Structure" do

  describe "Please write about_path" do
    it "You should write match to view pages/about use name about_path" do
      visit about_path
    end
  end
end
# тест 4  Написати шлях під іменем contact_path,info_path до сторінки info/index.html.erb contact/index.html.erb 
describe "Rails Structure" do

  describe "Please write contact_path,info_path" do
    it "You should write match to view info/index.html.erb contact/index.html.erb use contact_path,info_path" do
      visit info_path
      visit contact_path
      page.status_code.should be 200
    end
  end
end

