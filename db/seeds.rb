# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "csv"

Prefecture.find_or_create_by(id: 1, name: '北海道')
Prefecture.find_or_create_by(id: 2, name: '青森県')
Prefecture.find_or_create_by(id: 3, name: '岩手県')
Prefecture.find_or_create_by(id: 4, name: '宮城県')
Prefecture.find_or_create_by(id: 5, name: '秋田県')
Prefecture.find_or_create_by(id: 6, name: '山形県')
Prefecture.find_or_create_by(id: 7, name: '福島県')
Prefecture.find_or_create_by(id: 8, name: '茨城県')
Prefecture.find_or_create_by(id: 9, name: '栃木県')
Prefecture.find_or_create_by(id: 10, name: '群馬県')
Prefecture.find_or_create_by(id: 11, name: '埼玉県')
Prefecture.find_or_create_by(id: 12, name: '千葉県')
Prefecture.find_or_create_by(id: 13, name: '東京都')
Prefecture.find_or_create_by(id: 14, name: '神奈川県')
Prefecture.find_or_create_by(id: 15, name: '新潟県')
Prefecture.find_or_create_by(id: 16, name: '富山県')
Prefecture.find_or_create_by(id: 17, name: '石川県')
Prefecture.find_or_create_by(id: 18, name: '福井県')
Prefecture.find_or_create_by(id: 19, name: '山梨県')
Prefecture.find_or_create_by(id: 20, name: '長野県')
Prefecture.find_or_create_by(id: 21, name: '岐阜県')
Prefecture.find_or_create_by(id: 22, name: '静岡県')
Prefecture.find_or_create_by(id: 23, name: '愛知県')
Prefecture.find_or_create_by(id: 24, name: '三重県')
Prefecture.find_or_create_by(id: 25, name: '滋賀県')
Prefecture.find_or_create_by(id: 26, name: '京都府')
Prefecture.find_or_create_by(id: 27, name: '大阪府')
Prefecture.find_or_create_by(id: 28, name: '兵庫県')
Prefecture.find_or_create_by(id: 29, name: '奈良県')
Prefecture.find_or_create_by(id: 30, name: '和歌山県')
Prefecture.find_or_create_by(id: 31, name: '鳥取県')
Prefecture.find_or_create_by(id: 32, name: '島根県')
Prefecture.find_or_create_by(id: 33, name: '岡山県')
Prefecture.find_or_create_by(id: 34, name: '広島県')
Prefecture.find_or_create_by(id: 35, name: '山口県')
Prefecture.find_or_create_by(id: 36, name: '徳島県')
Prefecture.find_or_create_by(id: 37, name: '香川県')
Prefecture.find_or_create_by(id: 38, name: '愛媛県')
Prefecture.find_or_create_by(id: 39, name: '高知県')
Prefecture.find_or_create_by(id: 40, name: '福岡県')
Prefecture.find_or_create_by(id: 41, name: '佐賀県')
Prefecture.find_or_create_by(id: 42, name: '長崎県')
Prefecture.find_or_create_by(id: 43, name: '熊本県')
Prefecture.find_or_create_by(id: 44, name: '大分県')
Prefecture.find_or_create_by(id: 45, name: '宮崎県')
Prefecture.find_or_create_by(id: 46, name: '鹿児島県')
Prefecture.find_or_create_by(id: 47, name: '沖縄県')

# 駅情報初期化
if Station.all.count == 0 && StationLine.all.count == 0
  # ActiveRecord::Base.connection.execute('set foreign_key_checks = 0')
  # ActiveRecord::Base.connection.execute('TRUNCATE TABLE `stations`')
  # ActiveRecord::Base.connection.execute('TRUNCATE TABLE `station_joins`')
  # ActiveRecord::Base.connection.execute('TRUNCATE TABLE `station_lines`')
  # ActiveRecord::Base.connection.execute('TRUNCATE TABLE `station_line_prefectures`')
  # ActiveRecord::Base.connection.execute('set foreign_key_checks = 1')
  dir_path = File.dirname(__FILE__) + '/../db/seeds_data/station_201804/'
  companies = CSV.parse(File.read(dir_path + 'company.csv'), headers: true).pluck('company_cd', 'company_name').to_h
  stations = CSV.parse(File.read(dir_path + 'station.csv'), headers: true)
  lines = CSV.parse(File.read(dir_path + 'line.csv'), headers: true)

  db_companies = {}
  companies.each do |company|

    saved_company = Company.create({
      id: company['company_cd'].to_i,
      name: company['company_name'].to_s
    })
    db_companies[company['company_cd']] = saved_company[:id]

  end


  db_lines = {}
  lines.each do |line|
    saved_line = StationLine.create({
      name: line['line_name'].to_s,
      company_id: companies[line['company_cd']]
    })
    db_lines[line['line_cd']] = saved_line[:id]
  end





  db_stations = {}
  stations.each do |station|
    saved_station = Station.create({
      name: station['station_name'].to_s,
      prefecture_id: station['pref_cd'].to_i,
      station_line_id: db_lines[station['line_cd']].to_i,

    })
    db_stations[station['station_cd']] = saved_station[:id]
  end

  Prefecture.all.each do |pref|
    Station.where(prefecture_id: pref.id).includes(:station_line).map { |s| s.station_line }.uniq.each do |sl|
      StationLinePrefecture.create!(station_line: sl, prefecture: pref)
    end
  end
end
