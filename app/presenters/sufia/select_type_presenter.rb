module Sufia
  class SelectTypePresenter
    def initialize(concern)
      @concern = concern
    end

    attr_reader :concern

    def icon_class
<<<<<<< adminset_workflows
<<<<<<< adminset_workflows
      ModelIcon.css_class_for(concern)
=======
      translate('icon_class')
>>>>>>> Add a modal when there are many types of works to select from
=======
      ModelIcon.css_class_for(concern)
>>>>>>> All the work type icon generation in one place. Ref #2867
    end

    def description
      translate('description')
    end

    def name
      translate('name')
    end

    private

      def object_name
        @object_name ||= concern.model_name.i18n_key
      end

      def translate(key)
        defaults = []
        defaults << :"sufia.select_type.#{object_name}.#{key}"
        defaults << :"sufia.select_type.#{key}"
        defaults << ''
        I18n.t(defaults.shift, default: defaults)
      end
  end
end
