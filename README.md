simple-bypass
=============

Bypass firewalls for named hosts and specific ports easily. This utility works by creating SSH-tunnels and host-name overrides.

This utility merely packages existing available functionality.

For this utility to work, you need access to a SSH-server on an unfiltered network. The SSH-server itself has to be reachable on the network where other bypasses are wanted.

For instance, to access the GPG keyring-server "pool.sks-keyservers.net" over port 11371 on a filtered network, you would do the following:

    $ sudo ./simple-bypass.sh pool.sks-keyservers.net 11371

TODO: implement.
