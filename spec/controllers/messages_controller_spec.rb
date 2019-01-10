require 'rails_helper'

describe MessagesController do
  let(:group) { create(:group) }
  let(:user) { create(:user) }

  #メッセージ一覧を表示するアクションのテスト
  describe '#index' do

    #ログインしている場合
    context 'log in' do
      before do
        login user
        get :index, params: { group_id: group.id }
      end

      #アクション内で定義しているインスタンス変数があるか
      it 'assigns @message' do
        expect(assigns(:message)).to be_a_new(Message)
      end

      it 'assigns @group' do
        expect(assigns(:group)).to eq group
      end

      #該当するビューが描画されているか
      it 'renders index' do
        expect(response).to render_template :index
      end
    end

    #ログインしていない場合
    context 'not log in' do
      before do
        get :index, params: { group_id: group.id }
      end

      #意図したビューにリダイレクトできているか
      it 'redirects to new_user_session_path' do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end

