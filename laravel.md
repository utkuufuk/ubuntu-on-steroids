# Laravel Tips

## Creating a New Project
``` sh
# use default laravel version
laravel new <project_name>

# use specifici laravel version
composer create-project laravel/laravel=<version> <project_name> --prefer-dist

# install dependencies
composer install
```

## Changing Default Vue Scaffolding to React
 1. Change default scaffolding
    ``` sh
    php artisan preset react
    ```
 2. Rename `resources/js/components/Example.js` as `App.jsx`. Also rename the class as `App`, and HTML element ID as `app`.
 3. Replace `Example` with `App` in `resources/js/app.js`
 4. Create a new dir: `resources/assets` and move `js` and `sass` into it, then edit `webpack.mix.js` accordingly.
 5. Replace the section that starts with `<div class="content">` in `resources/views/welcome.blade.php` with the following:
    ``` html
    <!-- other stuff -->

                <div class="content">
                    <div id="app" class="title m-b-md">
                    </div>
                </div>

            </div>
        </body>
        <script type="text/javascript" src="{{mix('js/app.js')}}"></script>
    </html>
    ```
 6. Install dependencies and compile the React code with Laravel Mix:
    ``` sh
    npm install
    npm run hot
    ``` 
    
## Deploying with [Deployer](https://deployer.org/)
### Server Configuration
In your Ubuntu server:
 1. Create Directories & Configure Environment
    - Create directory: `/var/www/html/<project>/shared`
    - Copy your `.env` file inside `/var/www/html/<project>/shared`
    - Update the owner of `shared` directory:
        ```sh
        sudo chown -R www-data:www-data /var/www/html/<project>/shared
        ```
 2. Edit `/etc/apache2/sites-available/000-default.conf` as follows: 
    ``` con
    # edit this line
    DocumentRoot /var/www/html/<project>/current/public

        # insert this block within <VirtualHost> tag
        <Directory /var/www/html/<project>/current/public>
            Options Indexes FollowSymLinks MultiViews
            AllowOverride All
            Require all granted
        </Directory>
    ```
 3. Enable `mod_rewrite`:
    ``` sh
    sudo a2enmod rewrite
    ```
 4. Update `sudoers`:
    - Run: `sudo visudo`
    - Update the following line:
        ``` 
        # make sure that your user is in `sudo` group
        %sudo   ALL=(ALL:ALL) NOPASSWD: ALL
        ```
 5. Restart Apache: 
    ```
    sudo systemctl restart apache2
    ```

### Deploy
In your development machine:
 1. Install [Deployer](https://deployer.org/):
    ``` sh
    curl -LO https://deployer.org/deployer.phar
    mv deployer.phar /usr/local/bin/dep
    chmod +x /usr/local/bin/dep 
    ```
 2. Create a `deploy.php` file in your project directory using the `dep init` command.
 3. Optionally enable forwarding your SSH credentials: 
    - Create `~/.ssh/config` with the following content:
        ``` sh
        Host <hostname>
            User <username>
            ForwardAgent yes
        ```
    - Add your SSH key into Keychain:
        ```sh
        ssh-add -K <your_key> # e.g. ~/.ssh/id_rsa
        ```
 4. Deploy:
    ```sh
    dep deploy <hostname>
    ```

