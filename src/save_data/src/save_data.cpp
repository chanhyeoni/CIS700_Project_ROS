#include "ros/ros.h"
#include "std_msgs/String.h"
#include "std_msgs/Float64.h"

#include "gps_common/GPSFix.h"
#include "nav_msgs/Odometry.h"

#include "save_data/GPS_IMU.h"
#include <rosbag/bag.h>
#include <sstream>
#include <signal.h>


rosbag::Bag bag("data.bag", rosbag::bagmode::Write);
nav_msgs::Odometry temp_IMU;


void gps_callback(const gps_common::GPSFix::ConstPtr msg){

  save_data::GPS_IMU data;

  data.latitude = msg->latitude;
  data.longitude = msg->longitude;
  data.track = msg->track;
  data.speed = msg->speed;
  data.climb = msg->climb;

  // get the IMU part of the data
  data.pos_x = temp_IMU.pose.pose.position.x;
  data.pos_y = temp_IMU.pose.pose.position.y;
  data.pos_z = temp_IMU.pose.pose.position.z;

  data.orient_x = temp_IMU.pose.pose.orientation.x;
  data.orient_y = temp_IMU.pose.pose.orientation.y;
  data.orient_z = temp_IMU.pose.pose.orientation.z;
  data.orient_w = temp_IMU.pose.pose.orientation.w;

  data.linear_x = temp_IMU.twist.twist.linear.x;
  data.linear_y = temp_IMU.twist.twist.linear.y;
  data.linear_z = temp_IMU.twist.twist.linear.z;

  data.angular_x = temp_IMU.twist.twist.angular.x;
  data.angular_y = temp_IMU.twist.twist.angular.y;
  data.angular_z = temp_IMU.twist.twist.angular.z;

  if (msg->status.status != -1){ 
    data.label = 1;
  }else{ 
    data.label = -1;
    ROS_INFO("anomaly!");
  }
  
  // write to the bag file
  bag.write("data", ros::Time::now(), data);

}

void imu_callback(const nav_msgs::Odometry::ConstPtr& msg){
  temp_IMU = *msg;
}

void mySigintHandler(int sig)
{
  // Do some custom action.
  // For example, publish a stop message to some other nodes.
  
  // All the default sigint handler does is call shutdown()
  ros::shutdown();
}


int main(int argc, char **argv)
{

  ros::init(argc, argv, "save_data");

  ros::NodeHandle n;

  ros::Subscriber gps_sub = n.subscribe("/vehicle/perfect_gps/enhanced_fix", 1000, gps_callback);

  ros::Subscriber imu_sub = n.subscribe("/vehicle/perfect_gps/utm", 1000, imu_callback);

  ros::spin();

  signal(SIGINT, mySigintHandler);
  bag.close();

  return 0;
}
