# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

require 'devise'

# Create a user as adopter
User.create!(
  email: 'katie@adopt.com',
  user_type: 'adopter',
  name: 'Katie Kay',
  date_of_birth: '1988-04-05',
  phone: '1234567890',
  provider: 'email',
  password: 'adopttest',
  password_confirmation: 'adopttest'
)

# Create a user as admin
User.create!(
  email: 'katie@admin.com',
  user_type: 'admin',
  name: 'Katie Nova',
  date_of_birth: '1988-04-05',
  phone: '9876543210',
  provider: 'email',
  password: 'admintest',
  password_confirmation: 'admintest'
)