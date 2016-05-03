# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Config.create(sc_key: "pwd", sc_value: "admin", sc_note: "管理员密码")
Config.create(sc_key: "qn_ak", sc_value: "", sc_note: "七牛access_key")
Config.create(sc_key: "qn_sk", sc_value: "", sc_note: "七牛secret_key")
Config.create(sc_key: "slide_content", sc_value: "", sc_note: "侧边栏内容")