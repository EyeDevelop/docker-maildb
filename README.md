# MailDB
This is a companion to [mail-server](https://hub.docker.com/r/eyedevelop/mail-server).
This image initialises itself, but it does need two environment variables to be present:
* MYSQL_ROOT_PASSWORD
* MAILDB_PASSWORD

The `MYSQL_ROOT_PASSWORD` is absolutely required because it's used in the
initialisation scripts. MYSQL_RANDOM_ROOT_PASSWORD will **NOT** work.
Please generate your own secure password if a random password is what you need.

The `MAILDB_PASSWORD` specifies a password for the `mailadmin` user, which
can query the `maildb` database in this image.

## How to setup a domain
To get started creating email addresses, you first have to create a domain.
When the mail database is up and running, you can execute multiple
helper scripts inside the container to aid and simplify life,
so too the domain creation.

To create a domain, simply run:\
`$ docker exec -it <container_name> create-domain`

You will be asked for the domain name, and it will be created afterwards.

## Creating an email address.
Same as with the domain creation, you only need to run
a simple helper script to create an email address:\
`$ docker exec -it <container_name> create-user`

You will be asked for a username and a password. Afterwards, the user
is created and can be used.

## Creating an alias.
To create an email alias you use the `create-alias` helper
script:\
`$ docker exec -it <container_name> create-alias`

You will be asked for a 'from' and a 'to' address, after which
the email forward has been setup.

# Good luck and have fun!
If you like this image, please [donate a coffee](https://paypal.me/eyegaming2) :)