package.path = package.path ..";?.lua;test/?.lua;app/?.lua;"

require "Pktgen"
-- pktgen.page("range");


-- Set up 1st port
pktgen.set_mac("0","dst","3c:fd:fe:9c:5c:b8");
pktgen.set_mac("0","src","3c:fd:fe:9c:5c:a8");


pktgen.range.dst_ip("0", "start", "192.168.1.1");
pktgen.range.dst_ip("0", "inc", "0.0.0.1");
pktgen.range.dst_ip("0", "min", "192.168.1.1");
pktgen.range.dst_ip("0", "max", "192.168.1.128");

pktgen.set_ipaddr("0", "src", "192.168.0.1/24");
pktgen.set("0", "dport", 3000);
pktgen.set("0", "sport", 2000);


-- Set up 2nd port
pktgen.set_mac("1","dst","3c:fd:fe:9c:5c:a8");
pktgen.set_mac("1","src","3c:fd:fe:9c:5c:b8");

pktgen.range.dst_ip("1", "start", "192.168.0.1");
pktgen.range.dst_ip("1", "inc", "0.0.0.1");
pktgen.range.dst_ip("1", "min", "192.168.0.1");
pktgen.range.dst_ip("1", "max", "192.168.0.128");

pktgen.set_ipaddr("1", "src", "192.168.1.1/24");
pktgen.set("1", "dport", 2000);
pktgen.set("1", "sport", 3000);


-- Set up 3rd port
pktgen.set_mac("2","dst","3c:fd:fe:9c:5c:d8");
pktgen.set_mac("2","src","3c:fd:fe:9c:5c:c8");

pktgen.range.dst_ip("2", "start", "192.168.3.1");
pktgen.range.dst_ip("2", "inc", "0.0.0.1");
pktgen.range.dst_ip("2", "min", "192.168.3.1");
pktgen.range.dst_ip("2", "max", "192.168.3.128");

pktgen.set_ipaddr("2", "src", "192.168.2.1/24");
pktgen.set("2", "dport", 5000);
pktgen.set("2", "sport", 4000);


-- Set up 4th port
pktgen.set_mac("3","dst","3c:fd:fe:9c:5c:c8");
pktgen.set_mac("3","src","3c:fd:fe:9c:5c:d8");

pktgen.range.dst_ip("3", "start", "192.168.2.1");
pktgen.range.dst_ip("3", "inc", "0.0.0.1");
pktgen.range.dst_ip("3", "min", "192.168.2.1");
pktgen.range.dst_ip("3", "max", "192.168.2.128");

pktgen.set_ipaddr("3", "src", "192.168.3.1/24");
pktgen.set("3", "dport", 4000);
pktgen.set("3", "sport", 5000);


-- all port
pktgen.set("all", "size", 64);
pktgen.set_proto("all", "udp");
pktgen.set_range("all", "on");
