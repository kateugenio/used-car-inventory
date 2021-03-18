# README

## Overview

Used Car Sales Inventory. A basic inventory app for a used car sales manager and admin.
Specifications:
- Users can login and can have type “user” or “admin”
- Users can view the inventory of cars and their details
- “Admin” users can add and delete cars from the inventory
- Cars
  - Have a monetary price. The price depreciates 2% every month.
  - Can be new or used
- Cars are located at a dealership, there may be multiple dealerships

## Setup

### Environment Requirements
* Rails 6.0.2
* Ruby 2.6.6
* PostgreSQL 10.3
```
git clone https://github.com/kateugenio/used-car-inventory.git
cd used-car-inventory
bundle install
```

## Database setup

```
bundle exec rails db:setup
```

## Development

### Run Specs
```
bundle exec rspec
```

## Seeds
Create a user and admin:
```
bundle exec rails db:seed
```

To start the local server:
```
bundle exec rails s
```
From your browser, head to localhost:3000