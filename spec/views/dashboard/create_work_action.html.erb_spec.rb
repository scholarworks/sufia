require 'spec_helper'

<<<<<<< adminset_workflows
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
=======
RSpec.describe 'dashboard/_create_work_action.html.erb', type: :view do
>>>>>>> The 'New Work' link in the toolbar opens the modal
  before do
    allow(view).to receive(:create_work_presenter).and_return(presenter)
    allow(presenter).to receive(:first_model).and_yield(GenericWork)
    render
  end

  context "when we have more than one model" do
    let(:presenter) { instance_double(Sufia::SelectTypeListPresenter, many?: true) }

    it "renders the select template" do
<<<<<<< adminset_workflows
      expect(rendered).to have_content 'SelectType'
>>>>>>> Add a modal when there are many types of works to select from
=======
      expect(rendered).to have_selector 'a[data-toggle="modal"][data-target="#worktypes-to-create"]'
      expect(rendered).to have_link('Create Work', href: '#')
>>>>>>> The 'New Work' link in the toolbar opens the modal
    end
  end

  context "when we have one model" do
<<<<<<< adminset_workflows
<<<<<<< adminset_workflows
    let(:presenter) { instance_double(Sufia::SelectTypeListPresenter, many?: false) }

=======
    let(:results) { [GenericWork] }
    before do
      allow(classification).to receive(:each).and_yield(GenericWork)
      render 'dashboard/create_work_action', classification: classification
    end
>>>>>>> Add a modal when there are many types of works to select from
=======
    let(:presenter) { instance_double(Sufia::SelectTypeListPresenter, many?: false) }

>>>>>>> The 'New Work' link in the toolbar opens the modal
    it "doesn't draw the modal" do
      expect(rendered).not_to include "modal"
      expect(rendered).to have_link "Create Work", href: '/concern/generic_works/new'
    end
  end
end
