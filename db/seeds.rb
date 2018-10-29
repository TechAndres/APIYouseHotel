# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Reservation.find_or_create_by(user_name: 'andres')
Room.find_or_create_by(room_number:1, daily_rate: 30.99, available: false )
Room.find_or_create_by(room_number:2, daily_rate: 10.99, available: true )
Room.find_or_create_by(room_number:3, daily_rate: 40.99, available: true )
Room.find_or_create_by(room_number:4, daily_rate: 100.99, available: true )
Room.find_or_create_by(room_number:5, daily_rate: 100.99, available: false )
Room.find_or_create_by(room_number:6, daily_rate: 100.99, available: false )
Room.find_or_create_by(room_number:7, daily_rate: 100.99, available: true )
