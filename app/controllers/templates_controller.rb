class TemplatesController < InheritedResources::Base

  private

    def template_params
      params.require(:template).permit(:pmbok_doc_id, :user_id, :document)
    end
end

