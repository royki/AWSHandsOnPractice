- CloudWatch is a service that allows you to monitor various metrics inside your AWS account.
- CPU utilization is a great metric to measure how much of your EC2 instances' compute capacity is being used.
- CloudWatch alarms can trigger SNS topics.
- At any given time, a CloudWatch Alarm can be in one of three states. `Alarm` if the threshold you set has been triggered, `Ok` if the threshold you set has not been triggered, and `insufficient data` if an alarm hasn't yet (or can't) retrieve the required data to determine if the threshold has been triggered (or not).
- CloudWatch alarms are based on thresholds you create for specific CloudWatch metrics.