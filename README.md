# Tea Subscription API

This API manages customers and their tea subscriptions using Ruby on Rails.

## Install

    git clone git@github.com:amsalmeron/tea_subscription_api.git
    bundle install
    rails db:{drop,create,migrate,seed}

## Run the tests

    bundle exec rspec

## Database Schema

<img width="917" alt="Screen Shot 2022-09-16 at 8 43 47 AM" src="https://user-images.githubusercontent.com/93031998/190678271-80b54f57-fad1-48f5-96d0-a327c0f8cf7b.png">



# Endpoints

## Get list of subscriptions from a customer

### Request

`GET /api/v1/subscriptions`

  Body:
  
    {
      "customer_id" : "1"
    }

### Response Body

    {
    "data": [
        {
            "id": "1",
            "type": "subscription",
            "attributes": {
                "title": "Bronze",
                "status": true,
                "price": 10,
                "frequency": 1,
                "customer_subscriptions": [
                    {
                        "customer_id": 1,
                        "subscription_id": 1,
                        "status": true,
                        "id": 1
                    }
                ]
            }
        },
        {
            "id": "2",
            "type": "subscription",
            "attributes": {
                "title": "Silver",
                "status": true,
                "price": 30,
                "frequency": 1,
                "customer_subscriptions": [
                    {
                        "customer_id": 1,
                        "subscription_id": 2,
                        "status": true,
                        "id": 2
                    },
                    {
                        "customer_id": 2,
                        "subscription_id": 2,
                        "status": true,
                        "id": 4
                    }
                ]
            }
        },
        {
            "id": "3",
            "type": "subscription",
            "attributes": {
                "title": "Gold",
                "status": true,
                "price": 50,
                "frequency": 2,
                "customer_subscriptions": [
                    {
                        "customer_id": 1,
                        "subscription_id": 3,
                        "status": false,
                        "id": 3
                    },
                    {
                        "customer_id": 3,
                        "subscription_id": 3,
                        "status": false,
                        "id": 6
                    }
                ]
            }
        }
    ]
    }

## Create a new tea subscription

### Request

`POST /api/v1/subscriptions`

  Body:
  
      { 
        "customer_id" : "4", 
        "subscription_id" : "2"
      }
### Response

    {
    "data": {
        "id": "2",
        "type": "subscription",
        "attributes": {
            "title": "Silver",
            "status": true,
            "price": 30,
            "frequency": 1,
            "customer_subscriptions": [
                {
                    "customer_id": 1,
                    "subscription_id": 2,
                    "status": true,
                    "id": 2
                },
                {
                    "customer_id": 2,
                    "subscription_id": 2,
                    "status": true,
                    "id": 4
                },
                {
                    "customer_id": 4,
                    "subscription_id": 2,
                    "status": true,
                    "id": 7
                }
            ]
        }
      }
    }

## Cancel a customer subscription

### Request

`PATCH /api/v1/subscriptions`

  Body: 
  
    { 
      "customer_id" : "4", 
      "subscription_id" : "2"
    }
  

### Response

      {
        "message": "Silver has been cancelled"
      }
  
