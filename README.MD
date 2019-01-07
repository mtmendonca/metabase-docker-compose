# docker-compose-metabase

docker-compose-metabase is a boilerplate for deploying a [Metabase] stack with a local postgres database.

### Tech

- [Docker] - HTML enhanced for web apps!
- [docker-compose] - awesome web-based text editor
- [Metabase] - Markdown parser done right. Fast and easy to extend.
- [Postgresql] - great UI boilerplate for modern web apps

### Dependencies

You should have [Docker] and [docker-compose] installed.

### Installation

After cloning the repo, create a copy of `.env.sample` named `.env` and update the values as you wish.
Kick start docker-compose with the start script:

```sh
$ ./start.sh
```

This template creates a folder named `pg-data` in the root level of the project. You may back that up if you wish.

## Creating an AWS AMI with Ansible
tba

## Creating an Auto Scaling Group with AWS Cloudformation
tba

[docker]: https://www.docker.com
[docker-compose]: https://docs.docker.com/compose/install/
[metabase]: https://www.metabase.com
[postgresql]: https://www.postgresql.org/
