- Route 53 is the AWS service for managing domain names and DNS record sets.
- DNS servers are used to translate common language web domains into IP addresses. 
- For a web browsers to request data from a web server, it must know the IP address of the web server. If given a domain name (instead of an IP address), the browser "`asks`" a DNS server to translate the web domain into it's IP address.
- A web browser must have the IP address of a web server to locate it on the Internet.
- Route 53 automatically sends your DNS record information to DNS servers AND it is also where you decide where traffic request for that domain/IP address are routed.
    + To populate external DNS servers with domain/IP address information AND to route incoming traffic to the ELB.

