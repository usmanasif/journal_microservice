# Journal Microservice

This microservice provides CRUD operations for Journals and Entries, using Rails 7 with Turbo Stream and PostgreSQL. It also includes views for rendering the user interface.

## Requirements

- Ruby 3.1.2
- PostgreSQL 14.6
- Rails 7.0.4.3

## Setup

1. Clone the repository:
    ```bash
    $ https://github.com/Amin-Musharab/journal_microservice.git
    $ cd journal_microservice
    ```
2. Install dependencies:
    ```bash
        bundle install
    ```
3. Set up the database:
    ```bash
        rails db:create
        rails db:migrate
    ```
4.  Start the server:
    ```bash
        rails s
    ```
The server will start at `http://localhost:3000`

Note that test cases are not included in this project yet. I can add them using Rails testing framework.
