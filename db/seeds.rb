# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require "faker"

email_providers = ["gmail.com", "yahoo.com", "hotmail.com", "outlook.com", "aol.com"]

# Create multiple users
5.times do
  name = Faker::Name.first_name
  user = User.create!(
    first_name: name,
    last_name: Faker::Name.last_name,
    email: name,
    password: "password",
    password_confirmation: "password"
  )

  puts "Loading seed data for user: #{user.email}"

  # Create a workspace for each user
  workspace = Workspace.create!(
    name: "#{Faker::Company.name} Workspace",
    avatar_url: Faker::Company.logo,
    owner: user
  )

  # Create a team within the workspace
  team = Team.create!(
    name: "#{Faker::Team.name} Team",
    avatar_url: Faker::Company.logo,
    workspace_id: workspace.id
  )

  # Associate the user with the team
  team.users << user

  # Associate the user with the workspace
  workspace.users << user

  # Create an email server for the user
  email_server = EmailServer.create!(
    name: "#{Faker::Company.name} Email Server",
    email: user.email,
    provider: email_providers.sample,
    imap_server: "imap.#{user.email.split("@").last}",
    imap_port: 993,
    imap_ssl: true,
    password: "password",
    user: user,
    team: team
  )

  # Create some sample email threads for the user
  3.times do
    email_thread = EmailThread.create!(
      user: user,
      email_server: email_server,
      snippet: Faker::Lorem.sentence,
      summary: Faker::Lorem.sentence
    )

    # Create sample messages for each email thread
    2.times do
      Message.create!(
        user: user,
        email_thread: email_thread,
        email_server: email_server,
        sender_name: Faker::Name.name,
        from: Faker::Internet.email,
        to: user.email,
        subject: Faker::Lorem.sentence,
        snippet: Faker::Lorem.sentence,
        body: Faker::Lorem.paragraph,
        summary: Faker::Lorem.sentence,
        urgency: rand(5)
      )
    end
  end
end

puts "Seed data created successfully!"
