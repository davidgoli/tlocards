# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

User.delete_all
Download.delete_all
DownloadCode.delete_all

User.create(username: 'admin', password: 'asdfasdf', email: 'admin@tlocards.com')

dark_side = Download.create(title: 'Dark Side of the Moon', release_date: '03/01/1973', artist: 'Pink Floyd')
on_the_corner = Download.create(title: 'On the Corner', release_date: '10/11/1972', artist: 'Miles Davis')

DownloadCodeGenerator.new(dark_side).generate(10)
DownloadCodeGenerator.new(on_the_corner).generate(20)
