#!/bin/bash

source ./functions.sh
if [ ! -f "./.env" ] ; then log ".env not found abort"; exit ; fi
source .env

log "Starting setup.."

if [ "$SYSTEM_UPGRADE" == "Y" ] ; then
    log "Upgrading the system.."
    system_upgrade
fi
if [ "$GIT" == "Y" ] ; then
    log "Installing git.."
    install_git
fi
if [ "$NGINX" == "Y" ] ; then
    log "Installing nginx web server.."
    install_nginx
fi
if [ "$PHP" == "Y" ] ; then
    log "Installing php.."
    install_php
fi
if [ "$NODE" == "Y" ] ; then
    log "Installing NodeJS $NODE_VERSION"
    install_node "$NODE_VERSION"
    #
fi
if [ "$PIHOLE" == "Y" ] ; then
    log "Installing pihole network wide ad-blocker.."
    #
fi
if [ "$HOSTAPD" == "Y" ] ; then
    log "Installing hostapd hotspot.."
    #
fi
if [  "$GITEA" == "Y" ] ; then
    log "Installing gitea.."
    #
fi
if [ "$DOCKER" == "Y" ] ; then
    log "Installing docker and docker-compose.."
    install_docker
fi
# if [ "$GITEA" == "Y" ] ; then
#     #
# fi