module PmbokDocInputsHelper
  def get_inputs(doc_name)
    @doc_id=PmbokDoc.where('name =?',doc_name).pluck(:id)
    @inputs=PmbokDocInput.where('document_id =?',@doc_id[0]).all

    return @inputs

  end
end
