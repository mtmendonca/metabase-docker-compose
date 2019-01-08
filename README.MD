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
Create a copy of `.packer.env.sample` named `.packer.env` and add your AWS config:
```
AWS_REGION=
AWS_SOURCE_AMI=should be an amazon linux AMI avaiable in the region above
AWS_VPC_ID=vpc in which to run the EC2 instance that will become the AMI
AWS_SUBNET_ID=public subnet
```
Run the script:
```sh
$ ./build-ami.sh
```
## Creating an Auto Scaling Group with AWS Cloudformation
From `./aws/cloudformation`
Create a copy of `.cloudformation.env.sample` named `.cloudformation.env` and add your AWS config:
```
AWS_REGION=
AWS_CF_S3_BUCKET=S3 bucket to store cloudformation templates
ENVIRONMENT_NAME=cloudformation stack name
KEY_NAME=name of the key pair to use in the ec2 instance that will be spun up
INSTANCE_TYPE=one of https://aws.amazon.com/ec2/instance-types/
AMI=AMI ID output from build-ami.sh
VPC=VPC ID
SUBNETS=comma delimited list of subnets where the ASG will be available
```
To deploy the Auto Scaling Group:
```sh
$ cd aws/cloudformation/bin
$ ./package-template.sh
$ ./create-stack.sh
```
[docker]: https://www.docker.com
[docker-compose]: https://docs.docker.com/compose/install/
[metabase]: https://www.metabase.com
[postgresql]: https://www.postgresql.org/
