require 'spec_helper'

RSpec.describe Sufia::Workflow::CompleteNotification do
  let(:approver) { create(:user) }
  let(:depositor) { create(:user) }
  let(:to_user) { create(:user) }
  let(:cc_user) { create(:user) }
<<<<<<< adminset_workflows
<<<<<<< adminset_workflows
  let(:work) { create(:generic_work, user: depositor) }
  let(:entity) { create(:sipity_entity, proxy_for_global_id: work.to_global_id.to_s) }
  let(:comment) { double("comment", comment: 'A pleasant read') }
  let(:recipients) { { 'to' => [to_user], 'cc' => [cc_user] } }
=======
  let(:workflow) { Sipity::Workflow.create(name: 'foo') }
  let(:workflow_state) { Sipity::WorkflowState.create(name: 'bar', workflow: workflow) }
=======
>>>>>>> Use factories instead of AR instances
  let(:work) { create(:generic_work, user: depositor) }
  let(:entity) { create(:sipity_entity, proxy_for_global_id: work.to_global_id.to_s) }
  let(:comment) { double("comment", comment: 'A pleasant read') }
<<<<<<< adminset_workflows
  let(:recipients) { { to: [to_user], cc: [cc_user] } }
>>>>>>> Notifications should be sent for workflow actions. Fixes #2627.
=======
  let(:recipients) { { 'to' => [to_user], 'cc' => [cc_user] } }
>>>>>>> Use strings instead of symbols for workflow notification recipients

  describe ".send_notification" do
    it 'sends a message to all users' do
      expect(approver).to receive(:send_message).once.and_call_original

      expect { described_class.send_notification(entity: entity, user: approver, comment: comment, recipients: recipients) }
        .to change { depositor.mailbox.inbox.count }.by(1)
        .and change { to_user.mailbox.inbox.count }.by(1)
        .and change { cc_user.mailbox.inbox.count }.by(1)
    end
<<<<<<< adminset_workflows
    context 'without carbon-copied users' do
      let(:recipients) { { 'to' => [to_user] } }
      it 'sends a message to the to user(s)' do
        expect(approver).to receive(:send_message).once.and_call_original
        expect { described_class.send_notification(entity: entity, user: approver, comment: comment, recipients: recipients) }
          .to change { depositor.mailbox.inbox.count }.by(1)
          .and change { to_user.mailbox.inbox.count }.by(1)
      end
    end
=======
>>>>>>> Notifications should be sent for workflow actions. Fixes #2627.
  end
end
