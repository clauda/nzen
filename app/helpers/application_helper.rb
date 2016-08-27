module ApplicationHelper

  FLASH_CLASSES = {
    notice: "success",
    alert: "warning",
    error: "error",
    info: "info"
  }

  def flash_for name
    FLASH_CLASSES[name.to_sym]
  end

  def aggregations_for(aggs, field, key = nil)
    @aggregations = aggs[field]["buckets"].map do |status| 
      [ status["key"], status["doc_count"] ]
    end.to_h
    return key ? @aggregations[key] : @aggregations
  end

end
