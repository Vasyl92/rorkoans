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
