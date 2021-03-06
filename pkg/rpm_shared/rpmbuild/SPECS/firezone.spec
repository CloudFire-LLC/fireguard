Name:       firezone
Version:    0.2.0
Release:    1
Summary:    Web UI + Firewall manager for WireGuard™
URL:        https://firez.one
License:    ASL 2.0
Requires:   libc6
Requires:   net-tools
Requires:   wireguard-tools
Requires:   postgresql
Requires:   openssl
Requires:   systemd
Requires:   iptables

%description
Provides a web-based UI that allows you to configure WireGuard™ VPN tunnels and
set up firewall rules for your devices.

%post
/usr/lib/firezone/bin/postinst.sh

%files
%config /etc/firezone
/lib/systemd/system/firezone.service
/usr/lib/firezone
/usr/bin/firezone
