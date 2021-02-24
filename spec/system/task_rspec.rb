require 'rails_helper'
RSpec.describe 'タスク管理機能', type: :system do
  before do
    FactoryBot.create(:task)
    FactoryBot.create(:second_task)
  end
  describe '新規作成機能' do
    context 'タスクを新規作成した場合' do
      it '作成したタスクが表示される' do
        visit new_task_path
        fill_in "Name", with: "test_name1"
        fill_in "Description", with: "text_description1"
        click_on "登録する"
        expect(page).to have_content 'test_name1'
      end
    end
  end
  describe '一覧表示機能' do
    context '一覧画面に遷移した場合' do
      it '作成済みのタスク一覧が表示される' do
        visit tasks_path
        expect(page).to have_content 'test_name1'
      end
    end
    context 'タスクが作成日時の降順に並んでいる場合' do
      it '新しいタスクが一番上に表示される' do
        visit tasks_path
        task_list = all('tbody tr')
        expect(task_list[0]).to have_content 'test_name2'
        expect(task_list[1]).to have_content 'test_name1'
      end
    end
    context 'タスクが終了期限の昇順に並んでいる場合' do
      it '終了期限が近い物が一番上に表示される' do
        visit tasks_path
        click_on '終了期限でソートする'
        task_list = all('tbody tr')
        expect(task_list[0]).to have_content 'test_name1'
        expect(task_list[1]).to have_content 'test_name2'
      end
    end
  end
  describe '詳細表示機能' do
     context '任意のタスク詳細画面に遷移した場合' do
       it '該当タスクの内容が表示される' do
          visit task_path(1)
          expect(page).to have_content 'test_name1'
          visit task_path(2)
          expect(page).to have_content 'test_name2'
       end
     end
  end
end