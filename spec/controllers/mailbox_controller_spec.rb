require 'spec_helper'

describe MailboxController, type: :controller do
  before(:each) do
    @user = FactoryGirl.find_or_create(:jill)
    @another_user = FactoryGirl.find_or_create(:archivist)
    @message = "Test Message"
    @subject = "Test Subject"
    @rec1 = @another_user.send_message(@user, @message, @subject)
    @rec2 = @user.send_message(@another_user, @message, @subject)
    allow_any_instance_of(described_class).to receive(:authenticate_user!).and_return(true)
    sign_in @user
  end

  describe "#index" do
    it "shows message" do
      get :index
      expect(response).to be_success
      expect(assigns[:messages].first.last_message.body).to eq('Test Message')
      expect(assigns[:messages].first.last_message.subject).to eq('Test Subject')
      expect(@user.mailbox.inbox(unread: true).count).to eq(0)
    end
  end
  describe "#delete" do
    it "deletes message" do
      rec = @another_user.send_message(@user, 'message 2', 'subject 2')
      expect do
        delete :destroy, id: rec.conversation.id
        expect(response).to redirect_to(@routes.url_helpers.notifications_path)
      end.to change { @user.mailbox.inbox.count }.by(-1)
    end
    it "does not delete message" do
      @curator = FactoryGirl.find_or_create(:curator)
      rec = @another_user.send_message(@curator, 'message 3', 'subject 3')
      expect do
        delete :destroy, id: rec.conversation.id
        expect(response).to redirect_to(@routes.url_helpers.notifications_path)
      end.to_not change { @curator.mailbox.inbox.count }
    end
  end
  describe "#delete_all" do
    it "deletes message" do
      @another_user.send_message(@user, 'message 2', 'subject 2')
      @another_user.send_message(@user, 'message 3', 'subject 3')
      expect(@user.mailbox.inbox.count).to eq(3)
      get :delete_all
      expect(@user.mailbox.inbox.count).to eq(0)
    end
  end
end
