require 'rails_helper'
RSpec.describe 'ラベル管理機能', type: :system do
  describe "ラベル機能" do
    before do
      @user = FactoryBot.create(:user)
      @label = FactoryBot.create(:label)
      @label2 = FactoryBot.create(:label2)
      @task = FactoryBot.create(:task, user: @user)
      @second_task = FactoryBot.create(:second_task, user: @user)
      FactoryBot.create(:labelling, task: @task, label: @label)
      FactoryBot.create(:labelling, task: @second_task, label: @label2)
      visit new_session_path
      fill_in 'session[email]', with: 'admin@email.com'
      fill_in 'session[password]', with: 'admin_password'
      click_button "ログイン"
    end
    context "ラベル名で検索した場合" do
      it "検索したラベル名を持つタスクのみ表示される" do
        visit tasks_path
        select "label1", from: "label_id"
        click_on "検索"
        sleep(1)
        expect(page).to have_content "test_name1"
        expect(page).not_to have_content "test_name2"
      end
    end
    context "タスクの詳細画面に遷移した場合" do
      it "タスクに登録されたラベル名が表示される" do
        visit task_path(@task.id)
        expect(page).to have_content "label1"
      end
    end
    context "タスクを新規作成した場合" do
      it "詳細画面に保存したラベルが表示される" do
        visit new_task_path
        fill_in "タスク名", with: "test_name1"
        fill_in "詳しい内容", with: "test_description1"
        fill_in '終了期限', with: Time.current.since(20.day)
        select '未着手', from: 'ステータス'
        select '低', from: '優先度'
        check 'label1'
        check 'label2'
        click_on "登録する"
        expect(page).to have_content "label1"
        expect(page).to have_content "label2"
      end
    end
    context "タスクを編集でラベルを取り除いた場合" do
      it "ラベルが表示されない" do
        visit edit_task_path(@task.id)
        check "label2"
        uncheck "label1"
        click_on "更新する"
        expect(page).not_to have_content "label1"
        expect(page).to have_content "label2"
      end
    end
  end
end