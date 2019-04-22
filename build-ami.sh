#!/bin/bash
set -eak
source .packer.env
source .env

packer build ./packer_metabase_docker_compose.json