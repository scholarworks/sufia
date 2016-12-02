module Sufia
<<<<<<< HEAD
<<<<<<< adminset_workflows
<<<<<<< adminset_workflows
=======
>>>>>>> fe71a588caf3233ac303e8ab4bebf450e20934b9
  # Presents the list of work type options that a user may choose from when deciding to
  # create a new work
  class SelectTypeListPresenter
    # @param current_user [User]
    def initialize(current_user)
      @current_user = current_user
<<<<<<< HEAD
=======
  class SelectTypeListPresenter
    # @param classification [CurationConcerns::QuickClassificationQuery]
    def initialize(classification)
      @classification = classification
>>>>>>> Add a modal when there are many types of works to select from
=======
  # Presents the list of work type options that a user may choose from when deciding to
  # create a new work
  class SelectTypeListPresenter
    # @param current_user [User]
    def initialize(current_user)
      @current_user = current_user
>>>>>>> The 'New Work' link in the toolbar opens the modal
=======
>>>>>>> fe71a588caf3233ac303e8ab4bebf450e20934b9
    end

    class_attribute :row_presenter
    self.row_presenter = SelectTypePresenter

<<<<<<< HEAD
<<<<<<< adminset_workflows
<<<<<<< adminset_workflows
=======
>>>>>>> The 'New Work' link in the toolbar opens the modal
=======
>>>>>>> fe71a588caf3233ac303e8ab4bebf450e20934b9
    # @return [Boolean] are there many differnt types to choose?
    def many?
      authorized_models.size > 1
    end

    def authorized_models
      return [] unless @current_user
      @authorized_models ||= CurationConcerns::QuickClassificationQuery.new(@current_user).authorized_models
    end

    # Return or yield the first model in the list. This is used when the list
    # only has a single element.
    # @yieldparam [Class] model a class that decends from ActiveFedora::Base
    # @return [Class] a class that decends from ActiveFedora::Base
    def first_model
      yield(authorized_models.first) if block_given?
      authorized_models.first
    end

    # @yieldparam [SelectTypePresenter] presenter a presenter for the item
<<<<<<< HEAD
<<<<<<< adminset_workflows
    def each
      authorized_models.each { |model| yield row_presenter.new(model) }
=======
    def each
      @classification.each { |i| yield row_presenter.new(i) }
>>>>>>> Add a modal when there are many types of works to select from
=======
    def each
      authorized_models.each { |model| yield row_presenter.new(model) }
>>>>>>> The 'New Work' link in the toolbar opens the modal
=======
    def each
      authorized_models.each { |model| yield row_presenter.new(model) }
>>>>>>> fe71a588caf3233ac303e8ab4bebf450e20934b9
    end
  end
end
