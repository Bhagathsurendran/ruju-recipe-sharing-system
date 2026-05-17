# Ruji - Recipe Sharing System

A full-stack web application for sharing, discovering, and managing food recipes — supporting veg and non-veg categories, video recipes, likes, comments, and favourites.

---

## Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Tech Stack](#tech-stack)
- [Project Structure](#project-structure)
- [Installation & Setup](#installation--setup)
- [Database Setup](#database-setup)
- [Running the Server](#running-the-server)
- [User Roles](#user-roles)
- [App Pages Overview](#app-pages-overview)
- [Servlet Operations](#servlet-operations)
- [Known Issues & TODOs](#known-issues--todos)

---

## Overview

Ruji is a Java EE recipe sharing platform that allows users to post, browse, and interact with food recipes. It follows a classic MVC architecture with a single front-controller servlet routing all operations. The platform supports two roles — Admin and User — and provides full CRUD functionality for both recipes and users.

---

## Features

- **User authentication** — Login and signup with cookie-based session management
- **Role-based access** — Admin dashboard for platform management, user dashboard for personal activity
- **Recipe posting** — Users can add veg or non-veg recipes with food name, calorie count, category, image link, and description
- **Video recipes** — Dedicated section for video-format recipes with ingredients, equipment needed, duration, and video link
- **Like & Unlike** — Users can like or unlike individual recipes
- **Comments** — Users can post comments on veg and non-veg recipes
- **Favourites** — Users can mark and view their favourite recipes
- **Recipe search** — Search recipes by name, category, and type (veg/non-veg) with JSON response
- **Admin controls** — Admin can manage all users and recipes — create, update, and delete
- **User profile** — Users can update their profile details including username, email, password, and logo

---

## Tech Stack

| Layer | Technology |
|---|---|
| Backend | Java EE (Jakarta Servlet 5.0) |
| View | JSP (JavaServer Pages) |
| Database | MySQL |
| DB Driver | MySQL Connector/J 8.3.0 |
| Frontend | HTML, CSS, JavaScript |
| Server | Apache Tomcat |
| Architecture | MVC (Model-View-Controller) |

---

## Project Structure

```
Ruji-main/
├── src/
│   └── main/
│       ├── java/
│       │   ├── connection/
│       │   │   └── DBConnection.java       # JDBC connection setup
│       │   ├── model/
│       │   │   └── Model_class.java        # POJO — all entity fields
│       │   ├── service/
│       │   │   └── Service_class.java      # Business logic & SQL queries
│       │   └── servlet/
│       │       └── servlet.java            # Front-controller servlet
│       └── webapp/
│           ├── css/                        # Stylesheets per page
│           ├── img/                        # Static images and media
│           ├── META-INF/
│           │   └── MANIFEST.MF
│           ├── WEB-INF/
│           │   ├── lib/
│           │   │   └── mysql-connector-j-8.3.0.jar
│           │   └── web.xml                 # Servlet mapping config
│           ├── login.jsp
│           ├── signup.jsp
│           ├── loading.jsp
│           ├── admin.jsp
│           ├── user.jsp
│           ├── userDetail.jsp
│           ├── veg.jsp
│           ├── nonveg.jsp
│           ├── recipeVideo.jsp
│           ├── recipeVideoView.jsp
│           ├── typeTemplate.jsp
│           ├── updateUser.jsp
│           ├── delete.jsp
│           ├── deleteRecipe.jsp
│           ├── deleteRecipeUser.jsp
│           ├── deleteRecipeVideo.jsp
│           └── DeleteRecipeVideoUser.jsp
└── build/
    └── classes/                            # Compiled .class files
```

---

## Installation & Setup

### Prerequisites

- Java 11+
- Apache Tomcat 10+
- MySQL 8+
- IDE: Eclipse / IntelliJ IDEA (with Jakarta EE support)

### 1. Clone the repository

```bash
git clone https://github.com/Bhagathsurendran/Ruji-main.git
cd Ruji-main
```

### 2. Import into IDE

- Open Eclipse or IntelliJ IDEA
- Import as a **Dynamic Web Project** (Eclipse) or **Java EE Web Application** (IntelliJ)
- Ensure the project targets **Jakarta EE 9+** / **Tomcat 10+**

### 3. Add the MySQL connector

The `mysql-connector-j-8.3.0.jar` is already present in:

```
src/main/webapp/WEB-INF/lib/
```

Ensure your IDE build path includes this JAR.

---

## Database Setup

### 1. Create the database

```sql
CREATE DATABASE main_project;
USE main_project;
```

### 2. Create tables

```sql
CREATE TABLE user (
    id       INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100) UNIQUE NOT NULL,
    fullname VARCHAR(100),
    email    VARCHAR(150),
    password VARCHAR(100),
    type     VARCHAR(20) DEFAULT 'user',
    userlogo VARCHAR(255)
);

CREATE TABLE recipe (
    id                INT AUTO_INCREMENT PRIMARY KEY,
    username          VARCHAR(100),
    foodname          VARCHAR(150),
    calorie           INT,
    recipe            TEXT,
    category          VARCHAR(50),
    imglink           VARCHAR(255),
    recipeDescription TEXT,
    type              VARCHAR(20)
);

CREATE TABLE recipevideo (
    id          INT AUTO_INCREMENT PRIMARY KEY,
    foodname    VARCHAR(150),
    calorie     INT,
    recipe      TEXT,
    imglink     VARCHAR(255),
    RecipeDes   TEXT,
    Ingredients TEXT,
    Needed      TEXT,
    Duration    VARCHAR(100),
    videoLink   VARCHAR(255),
    username    VARCHAR(100)
);

CREATE TABLE comments (
    id           INT AUTO_INCREMENT PRIMARY KEY,
    username     VARCHAR(100),
    comments     TEXT,
    category     VARCHAR(50),
    foodRecipeId INT
);

CREATE TABLE liked (
    id           INT AUTO_INCREMENT PRIMARY KEY,
    username     VARCHAR(100),
    liked        VARCHAR(10),
    foodRecipeId INT,
    category     VARCHAR(50)
);

CREATE TABLE fav (
    id       INT AUTO_INCREMENT PRIMARY KEY,
    fid      INT,
    username VARCHAR(100),
    fav      VARCHAR(5),
    imglink  VARCHAR(255)
);
```

### 3. Create an admin user

```sql
INSERT INTO user (username, fullname, email, password, type)
VALUES ('admin', 'Administrator', 'admin@ruji.com', 'admin123', 'admin');
```

### 4. Update database credentials

Open `src/main/java/connection/DBConnection.java` and update the connection string if needed:

```java
con = DriverManager.getConnection(
    "jdbc:mysql://localhost:3306/main_project", "root", "your_password"
);
```

---

## Running the Server

### Using Eclipse

1. Right-click the project → **Run As** → **Run on Server**
2. Select **Apache Tomcat 10** and click **Finish**
3. Access the app at: `http://localhost:8080/Ruji-main/login.jsp`

### Using IntelliJ IDEA

1. Configure a Tomcat local server under **Run → Edit Configurations**
2. Add the project artifact as a deployment
3. Click **Run**
4. Access the app at: `http://localhost:8080/Ruji-main/login.jsp`

---

## User Roles

| Role | Description |
|---|---|
| **Admin** | Full platform control — manage all users and recipes, add video recipes, delete or update any content |
| **User** | Register, post recipes, like and comment on recipes, manage their own video recipes, mark favourites, update profile |

---

## App Pages Overview

| Page | Description |
|---|---|
| `login.jsp` | Login page — entry point for all users |
| `signup.jsp` | New user registration |
| `loading.jsp` | Transition screen after login before redirecting to user view |
| `admin.jsp` | Admin dashboard — user list, all recipes, video recipe management |
| `user.jsp` | User home page |
| `userDetail.jsp` | User profile — personal recipes, video recipes, favourites |
| `veg.jsp` | Browse and interact with vegetarian recipes |
| `nonveg.jsp` | Browse and interact with non-vegetarian recipes |
| `recipeVideo.jsp` | Video recipe listing page |
| `recipeVideoView.jsp` | Detailed view of a single video recipe |
| `typeTemplate.jsp` | Shared template for recipe category views |
| `updateUser.jsp` | Edit user profile form |
| `delete.jsp` | Confirm and process user deletion (admin) |
| `deleteRecipe.jsp` | Confirm and process recipe deletion (admin) |
| `deleteRecipeUser.jsp` | User-side recipe deletion |
| `deleteRecipeVideo.jsp` | Admin-side video recipe deletion |
| `DeleteRecipeVideoUser.jsp` | User-side video recipe deletion |

---

## Servlet Operations

All actions are handled by a single servlet at `POST /servlet` via an `operation` parameter.

| Operation | Description |
|---|---|
| `signUp` | Register a new user |
| `login` | Authenticate user and set cookies; redirects admin to `admin.jsp`, users to `loading.jsp` |
| `delete` | Admin deletes a user by ID |
| `delete-recipe` | Admin deletes a recipe by ID |
| `update` | Admin updates user details (username, fullname, email, password, type) |
| `updateUser` | User updates their own profile (username, fullname, email, password, userlogo) |
| `update-recipe` | Admin updates recipe details |
| `recipebtn` | User or admin posts a new veg/non-veg recipe |
| `addrecipevideoAdmin` | Admin adds a new video recipe |
| `addrecipevideoUser` | User adds a new video recipe |
| `delete-recipe-video` | Admin deletes a video recipe |
| `delete-recipe-video-User` | User deletes their own video recipe |
| `update-recipe-video` | Admin updates a video recipe |
| `update-recipe-video-Update` | User updates their own video recipe |
| `commentBtn` | User posts a comment on a recipe |
| `liked` | User likes a recipe |
| `unliked` | User unlikes a recipe |
| `recipeSearch` | Search recipes by name, category, and type — returns JSON |
| `fav` | User marks or unmarks a recipe as favourite |

---

## Known Issues & TODOs

- **Hardcoded DB credentials** — Username and password are hardcoded in `DBConnection.java`. Move to a properties file or environment variable before deploying.
- **Plaintext passwords** — Passwords are stored and compared as plaintext. Implement hashing (e.g. BCrypt) for security.
- **Deprecated JDBC driver class** — `com.mysql.jdbc.Driver` is deprecated. Update to `com.mysql.cj.jdbc.Driver`.
- **Single POJO model** — `Model_class.java` handles all entity types (user, recipe, video, comments, likes). Consider splitting into separate model classes as the project grows.
- **No input validation** — Form inputs are not validated server-side. Add validation and sanitization to prevent SQL injection and bad data (PreparedStatements are already used, but input checking is missing).
- **Cookie-based session** — Sessions rely on cookies without server-side session objects. Consider using `HttpSession` for better security.
- **No `requirements` / build file** — No `pom.xml` or `build.gradle` is present. Consider adding Maven or Gradle for dependency management.

---

## License

This project does not currently include a license file. All rights reserved by the author unless otherwise stated.
