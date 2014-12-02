paperg/phabricator
==================

[Phabricator][1] in a [Docker][2] container.

Creates volumes at `/var/repo` for repositories, and
`/usr/local/phabricator/phabricator/config/local` for Phabricator's
configuration. You probably want to make backups of these.

Expects to be [linked][4] to a MySQL database by the name of `mysql`. Consider
using [paperg/phabricator-mysql][3], which configures MySQL as suggested by
Phabricator. You really want to make backups of this database.

If you want an external database, then you could define these environment
variables with `docker run -e ...` to emulate the environment that would
otherwise be created with the `--link` option:

  - `MYSQL_PORT_3306_TCP_ADDR`
  - `MYSQL_PORT_3306_TCP_PORT`
  - `MYSQL_ENV_MYSQL_ROOT_PASSWORD`

Phabricator also needs to be told about the base URI for a lot of things to
work. You can set this by passing environment variable `BASE_URI`, which will
set the `phabricator.base-uri` configuration item for you.

  [1]: http://phabricator.org/
  [2]: http://docker.io/
  [3]: https://registry.hub.docker.com/u/paperg/phabricator-mysql/
  [4]: https://docs.docker.com/userguide/dockerlinks/
