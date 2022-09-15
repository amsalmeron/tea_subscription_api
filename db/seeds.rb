# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
CustomerSubscription.destroy_all
SubscriptionTea.destroy_all
Customer.destroy_all
Tea.destroy_all
Subscription.destroy_all

tony = Customer.create(firstname: 'Tony', lastname: 'Boo', email: 'tony@gmail.com', address: 'test1')
chad = Customer.create(firstname: 'Chad', lastname: 'Foo', email: 'chad@gmail.com', address: 'test2')
allison = Customer.create(firstname: 'Alison', lastname: 'Yoo', email: 'allison@gmail.com', address: 'test3')
boris = Customer.create(firstname: 'Boris', lastname: 'Hoo', email: 'boris@gmail.com', address: 'test4')

bronze = Subscription.create(title: 'Bronze', status: true, price: 10, frequency: 1)
silver = Subscription.create(title: 'Silver', status: true, price: 30, frequency: 1)
gold = Subscription.create(title: 'Gold', status: true, price: 50, frequency: 2)
platinum = Subscription.create(title: 'Platinum', status: true, price: 100, frequency: 4)

green = Tea.create(title: 'Green Tea', description: '4 stars', brew_time: 9, temperature: 95)
black = Tea.create(title: 'Black Tea', description: '5 stars', brew_time: 11, temperature: 93)
chai = Tea.create(title: 'Chai Tea', description: '5 stars', brew_time: 5, temperature: 97)
herbal = Tea.create(title: 'Herbal Tea', description: '3 stars', brew_time: 7, temperature: 90)

CustomerSubscription.create(customer_id: tony.id, subscription_id: bronze.id, status: true)
CustomerSubscription.create(customer_id: tony.id, subscription_id: silver.id, status: true)
CustomerSubscription.create(customer_id: tony.id, subscription_id: gold.id, status: false)
CustomerSubscription.create(customer_id: chad.id, subscription_id: silver.id, status: true)
CustomerSubscription.create(customer_id: chad.id, subscription_id: platinum.id, status: false)
CustomerSubscription.create(customer_id: allison.id, subscription_id: gold.id, status: false)