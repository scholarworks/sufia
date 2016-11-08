require 'spec_helper'

<<<<<<< adminset_workflows
RSpec.describe 'dashboard/_create_work_action.html.erb', type: :view do
  before do
    allow(view).to receive(:create_work_presenter).and_return(presenter)
    allow(presenter).to receive(:first_model).and_yield(GenericWork)
    render
  end

  context "when we have more than one model" do
    let(:presenter) { instance_double(Sufia::SelectTypeListPresenter, many?: true) }

    it "renders the select template" do
      expect(rendered).to have_selector 'a[data-toggle="modal"][data-target="#worktypes-to-create"]'
      expect(rendered).to have_link('Create Work', href: '#')
=======
RSpec.describe 'dashboard/create_work_action.html.erb', type: :view do
  let(:classification) { double }
  before do
    allow(CurationConcerns::QuickClassificationQuery).to receive(:new).and_return(classification)
    allow(view).to receive(:current_user).and_return(double)
    allow(classification).to receive(:authorized_models).and_return(results)
  end

  context "when we have more than one model" do
    let(:results) { [GenericWork, double] }
    before do
      stub_template 'dashboard/_select_work_type.html.erb' => 'SelectType'
      render 'dashboard/create_work_action', classification: classification
    end
    it "renders the select template" do
      expect(rendered).to have_content 'SelectType'
>>>>>>> Add a modal when there are many types of works to select from
    end
  end

  context "when we have one model" do
<<<<<<< adminset_workflows
    let(:presenter) { instance_double(Sufia::SelectTypeListPresenter, many?: false) }

=======
    let(:results) { [GenericWork] }
    before do
      allow(classification).to receive(:each).and_yield(GenericWork)
      render 'dashboard/create_work_action', classification: classification
    end
>>>>>>> Add a modal when there are many types of works to select from
    it "doesn't draw the modal" do
      expect(rendered).not_to include "modal"
      expect(rendered).to have_link "Create Work", href: '/concern/generic_works/new'
    end
  end
end
