package.path = package.path ..";?.lua;test/?.lua;app/?.lua;"

require "Pktgen"
--pktgen.page("range");

-- Set up first port
pktgen.range.dst_mac("0", "start", "3c:fd:fe:9c:5c:b8");
pktgen.range.src_mac("0", "start", "3c:fd:fe:9c:5c:d8");


pktgen.range.dst_ip("0", "start", "192.18.1.1");
pktgen.range.dst_ip("0", "inc", "0.0.0.1");
pktgen.range.dst_ip("0", "min", "192.18.1.1");
pktgen.range.dst_ip("0", "max", "192.18.1.128");

pktgen.set_ipaddr("0", "src", "192.18.0.1/24");
pktgen.set("0", "dport", 3000);
pktgen.set("0", "sport", 2000);
pktgen.range.pkt_size("0", "start", 256);
pktgen.range.pkt_size("0", "inc", 0);
pktgen.range.pkt_size("0", "min", 256);
pktgen.range.pkt_size("0", "max", 256);

-- Set up second port
pktgen.range.dst_mac("1", "start", "3c:fd:fe:9c:5c:d8");
pktgen.range.src_mac("1", "start", "3c:fd:fe:9c:5c:b8");

pktgen.range.dst_ip("1", "start", "192.18.0.1");
pktgen.range.dst_ip("1", "inc", "0.0.0.1");
pktgen.range.dst_ip("1", "min", "192.18.0.1");
pktgen.range.dst_ip("1", "max", "192.18.0.128");

pktgen.set_ipaddr("1", "src", "192.18.1.1/24");
pktgen.set("1", "dport", 2000);
pktgen.set("1", "sport", 3000);
pktgen.range.pkt_size("1", "start", 256);
pktgen.range.pkt_size("1", "inc", 0);
pktgen.range.pkt_size("1", "min", 256);
pktgen.range.pkt_size("1", "max", 256);

-- Set up all port
-- pktgen.set("all", "size", 64);
pktgen.set_proto("all", "udp");
pktgen.set_range("all", "on");
