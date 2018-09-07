require 'faker'
# Create Standard User
standard_user = User.create!(
  email: 'bp_standard@example.com',
  password: '123456',
  role: 'standard'
)
# Create Premium User
premium_user = User.create!(
  email: 'bp_premium@example.com',
  password: '123456',
  role: 'premium'
)
# Create Admin User
admin_user = User.create!(
  email: 'bp_admin@example.com',
  password: '123456',
  role: 'admin'
)

users = [standard_user, premium_user, admin_user]

# Create Some Wikis
30.times do
  wiki = Wiki.create!(
    title: Faker::Simpsons.location,
    body: Faker::ChuckNorris.fact,
    private: Faker::Boolean.boolean,
    user: users.sample
  )
end

puts "All Done =] and here are the results"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
