# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

customers = %w(
  Kenya
  Rwanda
)

customers.each do |customer|
  Customer.find_or_create_by(name: customer)
end

# 5.times do |no|
#   Customer.create(:name => "frank #{no}")
# end


require 'csv'
# CSV.foreach('db/seeds_sapporo_spot_en.tsv', {:encoding => "UTF-8", :col_sep => "\t", :quote_char => '"' }) do |row|
CSV.foreach('db/seeds_sapporo_spot_en.tsv', {:encoding => "UTF-8", :col_sep => "\t"}) do |row|
Location.find_or_create_by(:dataset_id => row[0],
                           :title => row[1],
                           :description => row[2], 
                           :geo_long => row[3],
                           :geo_lat => row[4],
                           :image => row[5],
                           :registered_date => row[6],
                           :subject => row[7],
                           :source => row[8],
                           :address => row[9],
                           :tel => row[10],
                           :url => row[11])
end

