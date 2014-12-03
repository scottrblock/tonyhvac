json.array!(@availibilities) do |availibility|
  json.extract! availibility, :id, :contractor_id, :day, :start_time, :end_time
  json.url availibility_url(availibility, format: :json)
end
