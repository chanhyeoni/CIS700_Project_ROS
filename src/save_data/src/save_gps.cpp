#include "ros/ros.h"
#include "std_msgs/String.h"
#include "std_msgs/Float64.h"
#include "gps_common/GPSFix.h"
#include "gps_common/GPSStatus.h"
#include <rosbag/bag.h>
#include "save_data/GPS.h"

rosbag::Bag bag("gps.bag", rosbag::bagmode::Write);

save_data::GPS data;

void gpsCallback(const gps_common::GPSFix msg)
{  
  data.latitude = msg.latitude;
  data.longitude = msg.longitude;
  // write to the bag file
  bag.write("gps_bag", ros::Time::now(), data);
  
}



int main(int argc, char **argv)
{

  ros::init(argc, argv, "save_gps");

  ros::NodeHandle n;

  ros::Subscriber sub = n.subscribe("/vehicle/perfect_gps/enhanced_fix", 1000, gpsCallback);

  ros::spin();

  bag.close();

  return 0;
}
