# Payment API Simulator 💳

A lightweight Ruby on Rails API that simulates payment transaction workflows — including authorization, capture, refund, and settlement.

## Features
- RESTful JSON API built with Ruby on Rails (API mode)
- Mock payment transaction lifecycle
- RSpec test coverage for endpoints and models
- Error handling for invalid transitions
- Ready for deployment to Heroku or Render

## Endpoints
| Method | Endpoint | Description |
|--------|-----------|-------------|
| POST | /transactions/authorize | Authorize payment |
| POST | /transactions/:id/capture | Capture payment |
| POST | /transactions/:id/refund | Refund payment |
| GET | /transactions/:id | Get transaction details |

## Setup
```bash
git clone https://github.com/<your-username>/payment_api_simulator.git
bundle install
rails db:migrate
rails s
