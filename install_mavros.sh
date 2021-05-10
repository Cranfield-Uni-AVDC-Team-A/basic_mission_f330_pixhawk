#!/bin/bash

sudo $(rospack find mavros)/scripts/install_geographiclib_datasets.sh
sudo usermod -a -G dialout $USER
