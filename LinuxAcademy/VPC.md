- VPC: Virtual Private Cloud. A VPC is your private, logically isolated section of AWS
- The proper structure of AWS Global Infrastructure - Regions -> Availability Zones -> Data Centers -> AWS Services
- NACL(Network Access Control List) - The security layer that allows/denies data from entering or exiting a subnet. NACLs provide security on the SUBNET level
- An Internet Gateway MUST be attached to a VPC for AWS resources, such as an EC2 instance, to have access to the Internet. If a VPC does NOT have an `IGW` attached, then NO resources inside of the VPC can access the internet.
- Availability Zones allow for this type of cloud architecture: High available and fault tolerant architecture.
    +  By utilizing multiple availability zones, cloud architects can create highly available and fault tolerant architecture.
- Route Tables are what direct the flow of traffic between resources within a VPC.