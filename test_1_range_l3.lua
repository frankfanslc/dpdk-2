package.path = package.path ..";?.lua;test/?.lua;app/?.lua;"

require "Pktgen"
--pktgen.page("range");


-- Port 0 3c:fd:fe:d8:53:d0,  Port 1 3c:fd:fe:d8:53:d1
port0_mac = "0C:42:A1:A4:94:90";


pktgen.range.dst_mac("0", "start", port0_mac);
pktgen.range.src_mac("0", "start", "02:00:00:00:00:00");

pktgen.range.dst_ip("0", "start", "192.18.1.1");
pktgen.range.dst_ip("0", "inc", "0.0.0.1");
pktgen.range.dst_ip("0", "min", "192.18.1.1");
pktgen.range.dst_ip("0", "max", "192.18.1.128");


pktgen.range.src_ip("0", "start", "192.168.0.1");
pktgen.range.src_ip("0", "inc", "0.0.0.1");
pktgen.range.src_ip("0", "min", "192.168.0.1");
pktgen.range.src_ip("0", "max", "192.168.0.128");

pktgen.range.dst_port("0", "start", 2000);
pktgen.range.dst_port("0", "inc", 1);
pktgen.range.dst_port("0", "min", 2000);
pktgen.range.dst_port("0", "max", 4000);

pktgen.range.src_port("0", "start", 5000);
pktgen.range.src_port("0", "inc", 1);
pktgen.range.src_port("0", "min", 5000);
pktgen.range.src_port("0", "max", 7000);


pktgen.range.pkt_size("0", "start", 64);
pktgen.range.pkt_size("0", "inc", 0);
pktgen.range.pkt_size("0", "min", 64);
pktgen.range.pkt_size("0", "max", 1518);

pktgen.set_proto("all", "udp");
pktgen.set_range("all", "on");
pktgen.start("all");
