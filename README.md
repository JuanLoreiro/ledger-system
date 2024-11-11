# LedgerMaster

To start your Phoenix server:

  * Run `mix setup` to install and setup dependencies
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix

Ledger System - Challenge
This project is an Elixir/Phoenix application to manage a basic accounting system that allows to handle financial transactions in real time.

Table of Contents
Description
Requirements
Environment Setup
Database Setup
Project Initialization
API Endpoints
Testing
Code Quality
Final Notes
Description
This project is a ledger application that allows to perform debit and credit operations on user accounts, providing the balance in real time through Phoenix.PubSub. In addition, it uses GenServer to handle concurrency and Ecto for database management.

Requirements
Make sure you have the following tools installed:

Elixir (version >= 1.15)
Erlang (compatible with Elixir version)
PostgreSQL (version >= 12)
Git (for version control)
Visual Studio Code (VS Code) as an editor, along with the following extensions:
ElixirLS
GitLens

Environment Setup
1. Clone the Repository


Terminal - Code 
git clone <repository_URL>
cd ledger_system

2. Install Dependencies
Run the following command to install the project dependencies:

Terminal - code
mix deps.get
3. Install Phoenix
If you don't have the Phoenix project generator, install it with:

Terminal - Code
mix archive.install hex phx_new
Database Setup
Make sure you have PostgreSQL running.
Access the PostgreSQL console and run the following commands to create a user and a database:

SQL - Code
CREATE USER phoenix_user WITH PASSWORD 'password';
CREATE DATABASE ledger_db OWNER phoenix_user;
ALTER USER phoenix_user CREATEDB;
Set up the database connection in config/dev.exs:

Elixir - Code
config :ledger_system, LedgerSystem.Repo,
username: "phoenix_user",
password: "password",
database: "ledger_db",
hostname: "localhost",
show_sensitive_data_on_connection_error: true,
pool_size: 10
Project Initialization
Run the migrations to create the tables:

Terminar - Code
mix ecto.create
mix ecto.migrate
Start the Phoenix server:


Terminal - Code
mix phx.server
The application will be available at http://localhost:4000.
API Endpoints
Create a User
Endpoint: POST /api/users
Description: Create a new user and an associated account.
Request Body:


Json - Code
{
"name": "Username",
"email": "email@example.com",
"password": "password"
}
Add Credit to Account
Endpoint: POST /api/credit
Description: Credits an amount to the user's account.
Request Body:


Json - Code
{
"user_id": 1,
"amount": 100.0
}
Debit Account
Endpoint: POST /api/debit
Description: Debits an amount to the user's account.
Request Body:


Json - Code
{
"user_id": 1,
"amount": 50.0
}
Get Current Balance
Endpoint: GET /api/balance
Description: Returns the current balance of the user's account.
Query Parameter: user_id
Tests
To run the tests, use the following command:

Terminal - Code
mix test
The tests are located in the test/ directory and cover all major modules and endpoints.

Code Quality
To check the code quality, run:

Terminal - Code
mix format
mix credo
mix dialyzer --plt

Final Notes
Monitoring and Fault Tolerance: The project uses a monitoring system to restart processes in case of failures, thus ensuring the resilience of the application.
Real-Time Updates: Phoenix.PubSub is configured to send real-time updates when a transaction is performed.
Compatibility: The project is optimized for Elixir 1.15 and PostgreSQL.
