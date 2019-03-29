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
  //std_msgs::Float64 latitude;
  //latitude.data = msg.latitude;
  //std_msgs::Float64 longitude = msg.longitude;
  
  data.latitude = msg.latitude;
  data.longitude = msg.longitude;

  bag.write("gps_bag", ros::Time::now(), data);
  ROS_INFO("I heard: [%f, %f]", data.latitude, data.longitude);
}



int main(int argc, char **argv)
{

  ros::init(argc, argv, "save_gps");

  ros::NodeHandle n;


  ros::Subscriber sub = n.subscribe("/vehicle/perfect_gps/enhanced_fix", 1000, gpsCallback);

/*
  ros::Publisher test_lat_pub = n.advertise<std_msgs::Float64>("test_gps_lat", 1000);
  ros::Publisher test_long_pub = n.advertise<std_msgs::Float64>("test_gps_long", 1000);

  ros::Rate loop_rate(10);  

  while (ros::ok())
  {

    std_msgs::Float64 latitude_msg;
    latitude_msg.data = latitude;

    std_msgs::Float64 longitude_msg;
    longitude_msg.data = latitude;

    test_lat_pub.publish(latitude_msg);
    test_long_pub.publish(longitude_msg);

    ros::spinOnce();

    loop_rate.sleep();
  }
*/

  ros::spin();

  bag.close();

  return 0;
}
