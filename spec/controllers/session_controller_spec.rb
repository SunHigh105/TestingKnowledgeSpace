require 'rails_helper'
describe SessionsController do
    subject{
        User.find_by(email: "unit@test.com")
    }
    context 'ログインできること' do
        before do
          get 'new'
          post 'create', params:{session:{email: subject.email, password: subject.password_digest}}
        end
        it { expect(:get => user_path(id: subject.id)).to route_to(:controller => "users", :action => "show", :id => "73") }
    end

    context 'ログアウトできること' do
        before do
          get 'new'
          post 'create', params:{session:{email: subject.email, password: subject.password_digest}}
          get 'delete'
        end
        it { expect(:get => root_path).to route_to(:controller => "static_pages", :action => "home") }
    end

    context '未入力のときエラーになること' do
        before do
          get 'new'
          post 'create', params:{session:{email: "", password: ""}}
        end
        it { expect(:get => login_path).to route_to(:controller => "sessions", :action => "new") }
    end

    context '未登録のメールアドレス・パスワードを入力するとエラーになること' do
        before do
          get 'new'
          post 'create', params:{session:{email: "unit2@test.com", password: "unittest2"}}
        end
        it { expect(:get => login_path).to route_to(:controller => "sessions", :action => "new") }
    end
end