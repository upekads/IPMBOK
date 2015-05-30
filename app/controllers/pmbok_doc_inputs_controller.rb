class PmbokDocInputsController < InheritedResources::Base

  private

    def pmbok_doc_input_params
      params.require(:pmbok_doc_input).permit(:subprocess_group_id, :document_id, :inputdocument_id)
    end
end

