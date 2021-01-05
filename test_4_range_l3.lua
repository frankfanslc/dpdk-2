package.path = package.path ..";?.lua;test/?.lua;app/?.lua;"

require "Pktgen"
--pktgen.page("range");


-- Port 0 3c:fd:fe:d8:53:d0,  Port 1 3c:fd:fe:d8:53:d1
port0_mac = "3C:FD:FE:D8:56:A0";
port1_mac = "3C:FD:FE:D8:56:A1";
port2_mac = "3C:FD:FE:D8:56:A2";
port3_mac = "3C:FD:FE:D8:56:A3";

-- Set up port0
pktgen.range.dst_mac("0", "start", port0_mac);
pktgen.range.src_mac("0", "start", "02:00:00:00:00:00");

pktgen.range.dst_ip("0", "start", "192.18.1.1");
pktgen.range.dst_ip("0", "inc", "0.0.0.1");
pktgen.range.dst_ip("0", "min", "192.18.1.1");
pktgen.range.dst_ip("0", "max", "192.18.1.128");
pktgen.set_ipaddr("1", "src", "192.18.0.1/24");
pktgen.set("0", "dport", 3000);
pktgen.set("0", "sport", 2000);


-- Set up port1
pktgen.range.dst_mac("1", "start", port1_mac);
pktgen.range.src_mac("1", "start", "02:00:00:00:00:01");

pktgen.range.dst_ip("1", "start", "192.18.0.1");
pktgen.range.dst_ip("1", "inc", "0.0.0.1");
pktgen.range.dst_ip("1", "min", "192.18.0.1");
pktgen.range.dst_ip("1", "max", "192.18.0.128");
pktgen.set_ipaddr("1", "src", "192.18.1.1/24");
pktgen.set("1", "dport", 2000);
pktgen.set("1", "sport", 3000);

-- Set up port2
pktgen.range.dst_mac("2", "start", port2_mac);
pktgen.range.src_mac("2", "start", "02:00:00:00:00:02");

pktgen.range.dst_ip("2", "start", "192.18.3.1");
pktgen.range.dst_ip("2", "inc", "0.0.0.1");
pktgen.range.dst_ip("2", "min", "192.18.3.1");
pktgen.range.dst_ip("2", "max", "192.18.3.128");
pktgen.set_ipaddr("2", "src", "192.18.2.1/24");
pktgen.set("2", "dport", 4000);
pktgen.set("2", "sport", 5000);

-- Set up port3
pktgen.range.dst_mac("3", "start", port3_mac);
pktgen.range.src_mac("3", "start", "02:00:00:00:00:03");

pktgen.range.dst_ip("3", "start", "192.18.2.1");
pktgen.range.dst_ip("3", "inc", "0.0.0.1");
pktgen.range.dst_ip("3", "min", "192.18.2.1");
pktgen.range.dst_ip("3", "max", "192.18.2.128");
pktgen.set_ipaddr("3", "src", "192.18.3.1/24");
pktgen.set("3", "dport", 5000);
pktgen.set("3", "sport", 4000);


pktgen.set_proto("all", "udp");
pktgen.set("all", "size", 64);
pktgen.set_range("all", "on");
