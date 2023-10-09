<p align="center"><a href="https://laravel.com" target="_blank"><img src="https://raw.githubusercontent.com/laravel/art/master/logo-lockup/5%20SVG/2%20CMYK/1%20Full%20Color/laravel-logolockup-cmyk-red.svg" width="400" alt="Laravel Logo"></a></p>

<p align="center">
<a href="https://github.com/laravel/framework/actions"><img src="https://github.com/laravel/framework/workflows/tests/badge.svg" alt="Build Status"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/dt/laravel/framework" alt="Total Downloads"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/v/laravel/framework" alt="Latest Stable Version"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/l/laravel/framework" alt="License"></a>
</p>

# Laravel Project Setup Guide

This guide will walk you through the steps to set up and run the Laravel project. Follow these steps to get your project up and running smoothly.

## Prerequisites

- Git installed on your system
- Composer installed on your system
- Node.js and npm installed on your system
- MySQL database server


## Update
1. **git pull**

## Installation

1. **Clone the Repository**: Open your terminal and navigate to the directory where you want to store the project. Run the following command to clone the repository and create a new folder for your project:

    ```sh
    git clone {url} {folder_name}
    ```

2. **Create .env File**: Navigate into your project folder and locate the `.env.example` file. Duplicate this file and rename the duplicate to `.env`. Open the `.env` file and modify the `DB_DATABASE` setting to match your local database configuration.

3. **Generate Application Key**: In the terminal, while still in your project folder, run the following command to generate a new application key:

    ```sh
    php artisan key:generate
    ```

4. **Run Migrations**: Run the following command to migrate your database:

    ```sh
    php artisan migrate
    ```

5. **Import Database**: Import the `cv-sneaker.sql` file into your local MySQL database.

6. **Install Node.js Dependencies**: Run the following command to install the required Node.js packages:

    ```sh
    npm install
    ```

7. **Run Development Server**: Start the development server and compile assets by running the following commands:

    ```sh
    php artisan serve
    npm run dev
    ```

    This will start the Laravel development server and compile your frontend assets using npm.

8. **Access Your Application**: Open your web browser and navigate to `http://localhost:8000` to access your Laravel application.

## Additional Notes

- If you encounter any issues during the setup process, make sure to check the Laravel documentation and your system's requirements.
- Make sure your MySQL server is running and properly configured with the credentials you specified in your `.env` file.

That's it! Your Laravel project should now be set up and ready to use.