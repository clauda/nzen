module ApplicationHelper

  def aggregations_for(aggs, field, key = nil)
    @aggregations = aggs[field]["buckets"].map do |status| 
      [ status["key"], status["doc_count"] ]
    end.to_h
    return key ? @aggregations[key] : @aggregations
  end
  
end
