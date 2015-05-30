module PmbokDocOutputsHelper
  def get_outputs(doc_name)
    @doc_id=PmbokDoc.where('name =?',doc_name).pluck(:id)
    @outputs=PmbokDocOutput.where('document_id =?',@doc_id[0]).all

    return @outputs

  end
end
