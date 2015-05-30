class WorkflowsController < InheritedResources::Base

  private

    def workflow_params
      params.require(:workflow).permit(:subprocess_group_id, :pmbok_doc_id, :direction, :direction_subprocess)
    end
end

