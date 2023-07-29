# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

ActiveRecord::Migration.say_with_time("creatin dividilo structure") do

  # (id: integer, name: string, password: string, users_id: integer, transactions_id: integer, created_at: datetime, updated_at: datetime)
  room = Room.find_or_create_by(
    name: 'room1',
  )
  room.password = '123'
  room.save!

  ActiveRecord::Migration.say("Room #{room.name}: #{room.persisted?}")
  if room.persisted?
    5.times do |i|
      user = User.find_or_create_by(
        name: "user#{i}",
        room_id: room.id,
      )
      user.password = '123'
      user.save!

      ActiveRecord::Migration.say("User #{user.name}: #{user.persisted?}")
      if user.persisted?
        3.times do |i|
          # (id: integer, amount: integer, user_id: integer, room_id: integer, description: string, created_at: datetime, updated_at: datetime)
          transaction = Transaction.find_or_create_by(
            amount: rand(1000),
            user_id: user.id,
            room_id: room.id,
            description: "transaction-#{i}",
          )
          transaction.save!

          ActiveRecord::Migration.say("Transaction #{transaction.description}: #{transaction.persisted? || transaction.errors.full_messages}")
        end
      end

    end
  end






end