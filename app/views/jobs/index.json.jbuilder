json.array!(@jobs) do |job|
  #json.extract! job, :id, :jobTitle, :jobDescription, :jobType, :jobCost, :jobQuotedPrice, :jobUrgency, :job_date
  json.id job.id
  json.title job.jobTitle
  json.description job.jobDescription
  json.start job.job_date
  if !job.job_date.nil?
    json.end job.job_date + 4.hours
  else
    json.end nil
  end
  json.url job_url(job, format: :html)
end
