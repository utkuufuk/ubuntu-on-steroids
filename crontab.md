## Cron Jobs Cheat Sheet
### Crontab Commands
``` sh
# display current user's crontab
crontab -l

# edit current user's crontab
crontab -e

# delete current user's crontab
crontab -r

# display <username>'s crontab
crontab -l -u <username>

# edit <username>'s crontab
crontab -e -u <username>

# delete <username>'s crontab
crontab -r -u <username>
```

### Crontab Syntax
``` crontab
# ┌───────────── minute (0 - 59)
# │ ┌───────────── hour (0 - 23)
# │ │ ┌───────────── day of month (1 - 31)
# │ │ │ ┌───────────── month (1 - 12)
# │ │ │ │ ┌───────────── day of week (0 - 6) (Sunday to Saturday;
# │ │ │ │ │                                       7 is also Sunday on some systems)
# │ │ │ │ │
# │ │ │ │ │
# * * * * *  command_to_execute
# 0 0 * * 1 echo 'Hello' >> /tmp/test.txt           every monday at midnight
# 0 0 1,15 * * echo 'Hello' >> /tmp/test.txt        every 1st and 15th of every month at midnight
# */10 * * * * echo 'Hello' >> /tmp/test.txt        every 10 minutes
# 0 12 * 5-8 * echo 'Hello' >> /tmp/test.txt        every noon from May to August
# */30 9-17 * * 1-5 echo 'Hello' >> /tmp/test.txt   every 30 mins between 9 AM - 5 PM in weekdays
```
