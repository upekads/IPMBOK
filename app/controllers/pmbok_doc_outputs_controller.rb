class PmbokDocOutputsController < InheritedResources::Base

  private

    def pmbok_doc_output_params
      params.require(:pmbok_doc_output).permit(:subprocess_group_id, :document_id, :outputdocument_id, :task)
    end
end

