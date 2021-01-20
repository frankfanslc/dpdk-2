package.path = package.path ..";?.lua;test/?.lua;app/?.lua;"

require "Pktgen"
--pktgen.page("range");


-- Port 0 3c:fd:fe:d8:53:d0,  Port 1 3c:fd:fe:d8:53:d1
port0_mac = "0C:42:A1:93:BB:94";


pktgen.range.dst_mac("0", "start", port0_mac);
pktgen.range.src_mac("0", "start", "02:00:00:00:00:00");

pktgen.range.dst_ip("0", "start", "192.18.1.1");
pktgen.range.dst_ip("0", "inc", "0.0.0.1");
pktgen.range.dst_ip("0", "min", "192.18.1.1");
pktgen.range.dst_ip("0", "max", "192.18.1.128");
pktgen.set_ipaddr("1", "src", "192.18.0.1/24");
pktgen.set("0", "dport", 3000);
pktgen.set("0", "sport", 2000);

pktgen.range.pkt_size("0", "start", 1518);
pktgen.range.pkt_size("0", "inc", 0);
pktgen.range.pkt_size("0", "min", 1518);
pktgen.range.pkt_size("0", "max", 1528);

pktgen.set_proto("all", "udp");
pktgen.set_range("all", "on");
