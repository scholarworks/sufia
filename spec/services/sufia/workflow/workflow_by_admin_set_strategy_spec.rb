describe Sufia::Workflow::WorkflowByAdminSetStrategy, :no_clean do
  before do
    allow(Flipflop).to receive(:enable_mediated_deposit?) { true }
  end
  context "when using default workflow strategy" do
    let(:workflow_strategy) { described_class.new(nil, {}) }

    describe '#workflow_name' do
      subject { workflow_strategy.workflow_name }
      it { is_expected.to eq 'default' }
    end
  end

  context "when using a non-default workflow strategy" do
    let!(:admin_set) { AdminSet.create(title: ["test"]) }
    let!(:permission_template) { Sufia::PermissionTemplate.create(workflow_name: workflow_name, admin_set_id: admin_set.id) }
    let(:workflow_name) { 'work' }
    let(:workflow_strategy) { described_class.new(nil, admin_set_id: admin_set.id) }

    describe '#workflow_name' do
      subject { workflow_strategy.workflow_name }
      it { is_expected.to eq workflow_name }
      context 'with mediated deposit disabled' do
        before do
          allow(Flipflop).to receive(:enable_mediated_deposit?) { false }
        end
        subject { workflow_strategy.workflow_name }
        it { is_expected.to eq 'default' }
      end
    end
  end
end
