json.array!(@reports) do |report|
  json.extract! report, :id, :title, :summary, :publication_date, :press_release, :main_report, :charts, :vid
  json.url report_url(report, format: :json)
end
