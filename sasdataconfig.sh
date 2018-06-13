#!/bin/bash


sudo pvcreate /dev/sd[c-j]

sudo vgcreate data-vg01 /dev/sd[c-j]

sudo lvcreate --extents 100%FREE --stripes 3 --name data-lv01 data-vg01 -readahead 32768 -stripesize 64

sudo mkfs -t xfs /dev/data-vg01/data-lv01

sudo mkdir /data

#Figure out to insert line into /etc/fstab | /dev/data-vg01/data-lv01  /data  xfs  defaults  0  2

#sudo mount -a