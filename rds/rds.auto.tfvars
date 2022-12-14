create_db_instance = true
identifier = "hyperion"
engine = "postgres"
#engine_version = "13.7.1"
instance_class = "db.t3.micro"
allocated_storage = 10
storage_type = "gp2"
db_name = "mbm-hyperion"
username = "hyperionkumar"
password = "qwerty123"
port = 5432
# network_type = "IPV4"
availability_zone = [["ap-northeast-1a"], ["ap-northeast-1c"]]
multi_az = false
publicly_accessible = false
allow_major_version_upgrade = true
auto_minor_version_upgrade = true
apply_immediately = false
maintenance_window = "Mon:00:00-Mon:01:30"
performance_insights_enabled = true
performance_insights_retention_period = 7
backup_retention_period = 7
backup_window = "02:00-02:30"
enabled_cloudwatch_logs_exports = ["postgresql", "upgrade"]
deletion_protection = false
delete_automated_backups = true

restore_to_point_in_time = null