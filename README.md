# Social Network Application

## Overview

This project is a social network application implemented using Python with a graphical user interface (GUI) built using Tkinter and CustomTkinter. The application allows users to manage their profiles, join clubs, follow other users, and view network statistics. Administrators can manage users and clubs, as well as view network graphs of clubs and user followers.

## Features

- **User Authentication**: Users can register, log in, and update their profiles.
- **User Management**: Admins can manage user accounts, including deletion.
- **Club Management**: Admins can add, update, and delete clubs. Users can join and leave clubs.
- **Follow System**: Users can follow other users and view suggestions based on their followers.
- **Network Visualization**: Admins can view visual graphs of club memberships and user follow relationships.

## Project Structure

- **`src/`**: Contains source code files.
  - `users.py`: Contains methods for user management.
  - `clubs.py`: Contains methods for club management.
  - `user_follow.py`: Contains methods for following users.
  - `user_club.py`: Contains methods for managing user-club relationships.
  - `network.py`: Contains methods for generating network graphs.
- **`views/`**: Contains GUI code.
  - `home.py`: Implements the main Tkinter application, including login, registration, user, and admin pages.
- **`data/`**: Contains data files.
  - `db_config.json`: Database configuration file.
  - `schema.sql`: SQL schema for database setup.
- **`network_graph/`**: Contains network graph HTML files.
  - `club_followers_network.html`: HTML file for visualizing club followers network.
  - `user_follow_network.html`: HTML file for visualizing user follow network.

## Installation

1. **Clone the Repository**
   ```sh
   git clone https://github.com/yourusername/social-network.git
   cd social-network
   ```

2. **Set Up a Virtual Environment** (Recommended)
   ```sh
   python -m venv venv
   source venv/bin/activate  # On Windows use `venv\Scripts\activate`
   ```

3. **Install Required Python Packages**
   ```sh
   pip install -r requirements.txt
   ```

4. **Set Up the Database**
   - Create a MySQL database and import the schema from `data/schema.sql`:
     ```sh
     mysql -u yourusername -p yourdatabase < data/schema.sql
     ```
   - Configure the database connection in `data/db_config.json` with your database details.

5. **Run the Application**
   ```sh
   python views/home.py
   ```

## Usage

- **Login Page**: Users can log in or register a new account.
- **User Page**: Access profile updates, join/leave clubs, follow/unfollow users.
- **Admin Page**: Manage users and clubs, view network statistics, and visualize networks.

## Contribution

Contributions are welcome! Please fork the repository and submit a pull request with your changes.

## Contact

For any questions or feedback, please contact [yousif.dahabra.97@gmail.com](mailto:your.email@example.com).
