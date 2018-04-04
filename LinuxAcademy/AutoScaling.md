AutoScaling Components
    - Launch Components: The EC2 template used when Auto Scaling needs to add an additional server to Auto Scaling Group.
    - Auto Scaling Groups: All the rules and settings that govern when an EC2 server is automatically added or removed.
- Auto Scaling is the process of scaling up and scaling down the number of EC2 instances based on traffic demands.
- Auto scaling provides automation that contributes to highly available and fault tolerant architecture. Auto scaling is not used to send messages (you are thinking of SNS).
- Auto Scaling is not an AWS security feature.