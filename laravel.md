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
    
## Deployment
### Permissions
Update permissions of the shared folder:
``` sh
chown -R www-data:www-data /var/www/html/<project>/shared
chmod -R g+w /var/www/html/<project>/shared
```

### Update Sites-Available
Update `/etc/apache2/sites-available/000-default.conf` file:
``` conf
# update this
DocumentRoot /var/www/html/<project>/current/public

    # insert this inside <VirtualHost>
    <Directory /var/www/html/periodic/current/public>
        Options Indexes FollowSymLinks MultiViews
        AllowOverride All
        Require all granted
    </Directory>
```

Enable `mod_rewrite`:
```
sudo a2enmod rewrite
```

### Edit Visudo
In order to bypass the Deployer `no tty` error
```
# edit the sudoers file
sudo visudo
```

Update this line:
```
# Allow members of group sudo to execute any command
%sudo   ALL=(ALL:ALL) NOPASSWD: ALL
```

Make sure that your user is in `sudo` group!

### Restart Apache
```
systemctl restart apache2
```
