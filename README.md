# Mittal Clothing Store

A full-stack e-commerce web application for browsing and purchasing men's clothing, built with PHP, MySQL, and vanilla JavaScript.

Features a customer-facing storefront with product browsing, cart management, and checkout — plus a separate admin dashboard for managing products, orders, categories, and users.

![PHP](https://img.shields.io/badge/PHP-8.2-777BB4?logo=php&logoColor=white)
![MySQL](https://img.shields.io/badge/MySQL-MariaDB_10.4-4479A1?logo=mysql&logoColor=white)
![JavaScript](https://img.shields.io/badge/JavaScript-ES6-F7DF1E?logo=javascript&logoColor=black)
![CSS](https://img.shields.io/badge/CSS3-Custom-1572B6?logo=css3&logoColor=white)

---

## Features

### Customer Side
- **User Authentication** — Register, login, and session management
- **Product Browsing** — Browse all products or filter by category (Formals, Traditionals, Jeans, Casual Shirts, Winter Wear)
- **Product Detail Pages** — View individual product details with quantity selection
- **Shopping Cart** — Add/remove items, adjust quantities, view subtotals
- **Checkout** — Multi-field address form with multiple payment method options
- **Order History** — View past orders and their payment status
- **User Profile** — View and manage account details

### Admin Dashboard
- **Dashboard Overview** — At-a-glance metrics: total revenue (pending/completed), order count, product count, user count
- **Product Management** — Add, edit, and delete products with image upload and category assignment
- **Order Management** — View all orders and update payment status (pending → completed)
- **User Management** — View registered users and admins

---

## Tech Stack

| Layer     | Technology                          |
|-----------|-------------------------------------|
| Backend   | PHP 8.2 (procedural + OOP)          |
| Database  | MySQL (MariaDB 10.4) via MySQLi     |
| Frontend  | HTML5, CSS3 (custom properties), vanilla JS |
| Icons     | Bootstrap Icons (CDN)               |
| Server    | Apache (XAMPP)                      |

---

## Database Schema

Four relational tables with foreign key constraints:

```
users ──────┐
  id (PK)   │
  name      ├──→ cart (user_id FK → users.id, pid FK → products.id)
  email     │
  password  ├──→ orders (user_id FK → users.id)
  user_type │
            │
products ───┘
  id (PK)
  name, category, price, details, image
```

- `users` — Stores customers and admins (differentiated by `user_type`)
- `products` — Product catalog with category, pricing, and image references
- `cart` — Session-based cart tied to authenticated users
- `orders` — Completed orders with address, payment method, and status tracking

---

## Setup & Installation

### Prerequisites
- [XAMPP](https://www.apachefriends.org/) (or any Apache + PHP + MySQL stack)
- PHP 8.0+
- MySQL / MariaDB

### Steps

1. **Clone the repository**
   ```bash
   git clone https://github.com/YOUR_USERNAME/ecommerce-platform.git
   ```

2. **Move to your web server directory**
   ```bash
   cp -r ecommerce-platform/ C:/xampp/htdocs/Clothingstore
   ```

3. **Create the database**
   - Open phpMyAdmin (`http://localhost/phpmyadmin`)
   - Create a new database called `clothingstore_db`
   - Import the SQL file: `sql/clothingstore_db.sql`

4. **Configure database connection**
   ```bash
   cp dbconnect.example.php dbconnect.php
   ```
   Edit `dbconnect.php` with your MySQL credentials.

5. **Run the application**
   - Start Apache and MySQL in XAMPP
   - Visit `http://localhost/Clothingstore`

### Demo Credentials (from seed data)
| Role  | Email               | Password         |
|-------|---------------------|------------------|
| Admin | admin@example.com   | admin_password   |
| User  | user@example.com    | user_password    |

---

## Project Structure

```
Clothingstore/
├── admin.php                # Admin dashboard
├── admin_header.php         # Admin navigation
├── admin_orders.php         # Order management panel
├── admin_product.php        # Product CRUD operations
├── admin_user.php           # User management panel
├── cart.php                 # Shopping cart page
├── category.php             # Category-filtered product listing
├── checkout.php             # Checkout form and order processing
├── dbconnect.example.php    # DB connection template (copy to dbconnect.php)
├── footer.php               # Shared footer component
├── header.php               # Shared navigation header
├── index.php                # Homepage — hero, categories, best sellers
├── login.php                # User/admin login
├── register.php             # New user registration
├── order.php                # Order history page
├── profile.php              # User profile page
├── shop.php                 # Full product catalog
├── view_page.php            # Single product detail page
├── main.css                 # Storefront styles
├── style.css                # Admin + auth page styles
├── script.js                # Client-side interactions
├── image/                   # Product images
├── img/                     # Site assets (hero, category banners)
└── sql/
    └── clothingstore_db.sql # Database schema + seed data
```

---

## Known Limitations & Future Improvements

This was built as a course project. Areas I'd improve with more time:

- **Password Security** — Passwords are stored in plaintext. A production version would use `password_hash()` / `password_verify()` with bcrypt.
- **SQL Injection** — Queries use `mysqli_real_escape_string` but not prepared statements. Migrating to PDO with parameterized queries would be more secure.
- **Input Validation** — Server-side validation is minimal. Would add comprehensive sanitization and CSRF token protection.
- **Payment Integration** — Currently simulates payment method selection. Could integrate Stripe or PayPal sandbox.
- **Responsive Design** — Partially responsive; could improve mobile breakpoints.
- **Image Optimization** — Product images are served as-is; would add compression and lazy loading.

---

