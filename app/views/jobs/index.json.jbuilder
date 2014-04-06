json.array!(@jobs) do |job|
  json.extract! job, :id, :title, :description, :code
  json.url job_url(job, format: :json)
end
