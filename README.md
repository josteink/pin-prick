pin-prick
=========

"It's not hacking the firewall. It's just making a tiny hole for yourself."

Bypass firewalls for named hosts and specific ports easily. This utility works by creating SSH-tunnels and host-name overrides.

This utility merely packages existing available functionality and doesn't rely on any "hacks" or malicious means.

For this utility to work, you need access to a SSH-server on an unfiltered network. The SSH-server itself has to be reachable on the network where other bypasses are wanted.

For instance, to access the GPG keyring-server "pool.sks-keyservers.net" over port 11371 on a filtered network, you would do the following:

**Usage**

    $ sudo ./pin-prick.sh pool.sks-keyservers.net 11371

To remove the bypass(es), issue the following command:

    $ sudo ./pin-prick.sh -R

**Known limitations**

The following limitations apply:

* Root/sudo needed.
* Once a host has been "pin-pricked", it can only be accessed through pin-pricked holes.
* You can only pin-prick one port per session.

