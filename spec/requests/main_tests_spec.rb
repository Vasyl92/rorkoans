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
# тест 5  Створити гіперпосилання link 'About' to about_path розмістити pages/index.html.erb "
describe "View" do

  describe "Link creating (root page active)" do

    it "You should  create link 'About' to about_path " do
        visit root_path
        expect(page).to have_link('About')
        click_link('About') 
        expect(page).to have_content('Pages#about')
        page.status_code.should be 200 
      end
  end
end
#------------------------------------------------5-----------------------------------------------------------------------
# тест 6  Створити гіперпосилання link 'Index' 'Info' 'Contact' to root_path, info_path, contact_path розмістити pages/index.html.erb "
describe "View" do

  describe "Link creating (root page active)" do

    it "You should  create link 'Index','Info','Contact' to about_path,info_path,contact_path " do
        visit root_path
        page.status_code.should be 200 
        expect(page).to have_link('Index')
        click_link('Index') 
        expect(page).to have_content('Pages#index')
        page.status_code.should be 200 
        expect(page).to have_link('Info')
        click_link('Info') 
        expect(page).to have_content('Pages#info')
        page.status_code.should be 200 
        visit root_path
        expect(page).to have_link('Contact')
        click_link('Contact') 
        expect(page).to have_content('Pages#contact')
        page.status_code.should be 200 
      end
  end
end
# тест7 Створити файл _menu.html.erb в ayouts/partials і перемістити всі посилання із кореневої сторінки. Підключити partial application.html.erb
describe "View" do

  describe "Use partial for links" do

    it "You should create create file(_menu.html.erb) in layouts/partials containing all links and inlude partial in application.html.erb " do
        get "pages/index"
        response.should render_template(:partial => "layouts/partials/_menu")
      end
  end
end
# тест8 Підключення файлу стилів my.css і використати стиль zagolovok для всіх гіперпосиланнь в _menu.html.erb
describe "View" do
      describe "Include CSS-style file" do
        it "You should  create include my_css.css style and add use style zagolovok for all links in _menu.html.erb " do
         visit root_path
         expect(page).to have_selector('div.zagolovok')
         end
      end
end
# тест9 Підключення div#top_menu  для всіх гіперпосиланнь в _menu.html.erb
describe "View" do
      describe "Include div#top_menu" do
        it "You should  put content of _menu.html.erb into div#top_menu" do
         visit root_path
         expect(page).to have_selector('div#top_menu')
         end
      end
end
# тест10 Змініть назву заголовку на RoRkoans | Index в root
describe "View" do
      describe "Change title" do
        it "should have the right title RoRkoans | Index in pages#index" do
            visit root_path
            expect(page).to have_title('RoRkoans | Index')
         end
      end
end
#------------------------------------------------10-----------------------------------------------------------------------
# тест11 Витріть вміст контенту pages#about і розмістіть там зображення
describe "View" do
      describe "Work with image" do
          it " You should use Rails.png to put an image in the view " do
          visit about_path
          expect(page).to have_selector("img", :count => 1)
    end
  end
end
# тест12 Створення моделі User, generate model User name:string email:string and run bundle exec rake db:test:prepare
describe "Model" do
      describe "Models generation" do
          it "Generate model User name:string email:string " do
          @user = User.new(name: "Example User", email: "user@example.com")
    end
  end
end

# тест13 Створення валідаторів наявності на поля name:string email:string
describe "Model" do
      describe "Validators" do
          it "You should add validators of presence: true for name" do
          @user = User.new(name: "Example User", email: "user@example.com")
          @user.name = " "
          @user.should_not be_valid
    end
  end
end
# тест14 Створення валідаторів довжини не більше 51 символа для поля name
describe "Model" do

  describe "Validators" do

        before { @user = User.new(name: "Example User", email: "user@example.com")}
        before { @user.name = "a" * 51 }
        subject { @user }

          it "You should add length validator 51 symbols for field name" do
          should_not be_valid
        end
    end
end
# тест15 Створення валідаторів формату поля email

describe "Model" do

  before { @user = User.new(name: "Example User", email: "user@example.com")}
  
  describe "Validators" do

    it " You should add format validator for field email " do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
        @user.email = invalid_address
        @user.should_not be_valid
        end

      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @user.email = valid_address
        @user.should be_valid
      end
    end
  end
end
#------------------------------------------------15-----------------------------------------------------------------------
# тест16 Валидация унікальності щоб не збереглися однакові користувачі
describe "Model" do
    before { @user = User.new(name: "Example User", email: "user@example.com")}
        subject { @user }
    describe "Validators" do
      before do
        user_with_same_email = @user.dup
            user_with_same_email.save
      end
          it "You should add validators of uniqueness for field name" do
          should_not be_valid
        end
    end
end
#Тест №17 Валидация чутливості до регістру поля email
describe "Model" do
    before { @user = User.new(name: "Example User", email: "user@example.com")}
        subject { @user }
  describe "Validators" do
      before do
        user_with_same_email = @user.dup
            user_with_same_email.email = @user.email.upcase
            user_with_same_email.save
      end
           it "You should add validators of case_sensitive for field email" do
          should_not be_valid
        end
    end
end

#Тест №18 Добавлення поля password для моделі User

describe "Model" do

      before do
        @user = User.new(name: "Example User", email: "user@example.com")
      end

      subject { @user }

      describe "Adding field to the model" do
          it "You should add field password to the model User " do
          should respond_to(:name)
          should respond_to(:email)
          should respond_to(:password)
    end
  end
end



