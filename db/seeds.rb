# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Wzx.delete_all
Wzx.create! name: "曲阜师范大学", information: "软件学院", food: "麻辣烫", tuijian: "西联教室", pt: [116.96, 35.59]
Wzx.create! name: "曲阜师范大学", information: "文学院", food: "麻辣烫", tuijian: "大学生活动中心", pt: [25.0, 31.0]