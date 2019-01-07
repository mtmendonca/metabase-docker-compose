#!/bin/bash
set -eak
source .packer.env

packer build ./packer_metabase_docker_compose.json