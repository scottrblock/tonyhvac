json.array!(@item_details) do |item_detail|
  json.extract! item_detail, :id, :description, :item_id, :job_id
  json.url item_detail_url(item_detail, format: :json)
end
