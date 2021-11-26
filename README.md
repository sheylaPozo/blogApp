# Blog App

![Microverse](https://img.shields.io/badge/Microverse2.0-blueviolet) ![app](https://img.shields.io/badge/Myapp-blue)

Blog App

> Blog website that shows a list of posts and empower readers to interact with them by adding comments and liking posts. This project is part of Microverse's 2.0 curriculum, following the guidelines of ![Microverse](https://img.shields.io/badge/Microverse2.0-blueviolet)[🔗](https://www.microverse.org/) for best practices.

## 🤍 Built With
---
- 🤍Ruby
- 🤍Ruby on Rails
- 🤍PostgreSQL
---
## 🤍Getting Started

To get a local copy up and running follow these simple example steps.

### 🤍Prerequisites

- [Ruby](https://www.ruby-lang.org/en/)
- [Rails](https://gorails.com/)

### 🤍Setup

- Make sure you have Ruby on Rails set up properly on your computer
- Clone or download this repo on your machine
- Enter project directory

### 🤍Install

```sh
bundle install
```

### 🤍Database

```sh
# Create user
sudo -u postgres createuser blog -s

# Create the database
rake db:create

# Load the schema
rails db:schema:load

# Seed
rails db:seed

## Apply migration (only if you generate a new migration file)
rails db:migrate
```

### 🤍Run

```sh
rails s
```

### 🤍Test

```sh
rspec
```

### 🤍Troubleshoot

### Rspec failing

```sh
RAILS_ENV=test rake db:reset
```

## 🤍 Author:
---
👤 **Sheyla Pozo** 🤍

- Github:[sheylaPozo](https://github.com/sheylaPozo)
- Twitter: [@sheyPozo](https://twitter.com/sheyPozo)
- Linkedin: [Sheyla Pozo](https://www.linkedin.com/in/sheypozo/)

---
## 🤝 Contributing:

Contributions, issues, and feature requests are welcome! 🤍

Feel free to check the [issues page](https://github.com/sheylaPozo/blogApp/issues).

## 🤍 Show your support:

Give a `⭐️` if you like this project!

## 🤍 Acknowledgments:

Hat tip to anyone whose code was used:
- Microverse's guidelines
- Inspiration

## 📝 License 🤍:

This project is [MIT](./LICENSE.md) licensed.
