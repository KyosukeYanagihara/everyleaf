require 'rails_helper'
RSpec.describe "ユーザ管理機能", type: :system do
  before do
    @general_user = FactoryBot.create(:general_user)
    @user = FactoryBot.create(:user)
  end
  describe 'ユーザ登録のテスト' do
    context "ユーザの新規登録ができること" do
      it '新規登録したユーザが表示される' do
        visit new_user_path
        fill_in "user[name]",	with: "test_name" 
        fill_in "メールアドレス",	with: "test@email.com" 
        fill_in "パスワード",	with: "test_password" 
        fill_in "確認用パスワード",	with: "test_password" 
        click_on "登録する"
        sleep(1)
        expect(page).to have_content "新規登録しました"
        expect(page).to have_content "test_name"
        expect(page).to have_content "test@email.com"
      end
    end
    context "ユーザがログインせずタスク一覧画面に飛ぼうとしたとき、ログイン画面に遷移すること" do
      it "ログイン画面へ" do
        visit tasks_path
        expect(page).to have_content "ログイン画面"
      end
    end
  end
  describe "セッション機能のテスト" do
    before do
      visit new_session_path
      fill_in "session[email]",	with: "general@email.com" 
      fill_in "session[password]", with: "general_password"
      click_button "ログイン"
    end
    context "ログインができること" do
      it "ログインする" do
        expect(page).to have_content "ログインしました"
      end
    end
    context "自分のマイページに飛べること" do
      it "マイページへ" do
        click_on "general_name"
        sleep(1)
        expect(page).to have_content "general_name"
        expect(page).to have_content "general@email.com"
      end
    end
    context "一般ユーザが他人の詳細画面に飛ぶとタスク一覧に遷移すること" do
      it "タスク一覧に遷移する" do
        visit user_path(@user.id)
        expect(page).to have_content "権限がありません"
      end
    end
    context "ログアウトができること" do
      it "ログアウトする" do
        click_on "ログアウト"
        sleep(1)
        expect(page).to have_content "ログイン画面"
      end
    end
  end
  describe "管理画面のテスト" do
    context "一般ユーザは管理画面にアクセスできない場合" do
      it "一般ユーザは管理画面にアクセスできない" do
        visit new_session_path
        fill_in "session[email]",	with: "general@email.com" 
        fill_in "session[password]", with: "general_password"
        click_button "ログイン"
        visit admin_users_path
        expect(page).to have_content "管理者以外はアクセスできません"
      end
    end
    context "管理ユーザは管理画面にアクセスできる場合" do
      before do
        visit new_session_path
        fill_in "session[email]",	with: "admin@email.com" 
        fill_in "session[password]", with: "admin_password"
        click_button "ログイン"
      end
      it "管理ユーザは管理画面にアクセスできること" do
        visit admin_users_path
        expect(page).to have_content "ユーザー新規作成"
      end
      it "管理ユーザはユーザの新規登録ができること" do
        visit new_admin_user_path
        fill_in "user[name]",	with: "test_name" 
        fill_in "user[email]",	with: "test@email.com" 
        fill_in "user[password]",	with: "test_password" 
        fill_in "user[password_confirmation]",	with: "test_password" 
        choose '管理者権限あり'
        click_on "登録する"
        sleep(1)
        expect(page).to have_content "test_name"
      end
      it "管理ユーザはユーザの詳細画面にアクセスできること" do
        visit admin_user_path(@general_user.id)
        expect(page).to have_content "ユーザー詳細画面"
        expect(page).to have_content "general_nameのタスク"
      end
      it "管理ユーザはユーザの編集画面からユーザを編集できること" do
        visit edit_admin_user_path(@general_user.id)
        fill_in "user[name]", with: "edit_name"
        fill_in "user[email]", with: "edit@email.com"
        fill_in "user[password]", with: "editpass"
        fill_in "user[password_confirmation]", with: "editpass"
        choose '管理者権限あり'
        click_on "登録する"
        expect(page).to have_content "edit_name"
      end
      it "管理ユーザはユーザの削除をできること" do
        visit admin_users_path
        click_on "削除", match: :first
        page.accept_confirm
        expect(page).not_to have_content "general_name"
      end
    end
  end
end
