#!/usr/bin/env python

'''
	attack_gps republises manually generated, anomolous data to the same topic 
	/vehicle/perfect_gps/enhanced_fix from dataspeed_dbw_gazebo_demo. In detail,
	attack_gps creates the anomalous data periodically.
'''

import sys
import rospy
import random

from std_msgs.msg import String
from gps_common.msg import GPSFix

''' define necessary global variables '''
normal_data = GPSFix()	
normal_lat_min_value = sys.float_info.min
normal_lat_max_value = sys.float_info.max
normal_long_min_value =sys.float_info.min
normal_long_max_value = sys.float_info.max
anomaly_data_range = 0	

'''
	a callback function that assigns a subcribed GPS data from topic (/vehicle/perfect_gps/enhanced_fix) to normal_data, which will be used to create fake data
'''
def get_normal_GPSFix_callback(data):
	normal_data.latitude = data.latitude
	normal_data.longitude = data.longitude
	normal_data.track = data.track
	normal_data.speed = data.speed
	normal_data.climb = data.climb


''' 
	a function that returns a fake GPS data with wrong, anomalous latitude and longitude.
	In detail, the function takes parameter data suscribed from the topic and
'''
def create_anomalous_GPSFix(command):
	# copy 
	if (command == 'zero_lat_long'):
		normal_data.latitude = 0
		normal_data.longitude = 0
	elif (command == 'similar_values'):
		anomaly_data_range = rospy.get_param('/attack_gps/similar_values_attack/anomaly_data_range')
		# the only way to generate randome values that are (+)/(-) range of anomaly_data_range is
		# to use python's random library
		normal_data.latitude = random.uniform(normal_lat_min_value-anomaly_data_range, normal_lat_max_value+anomaly_data_range)
		normal_data.longitude = random.uniform(normal_long_min_value-anomaly_data_range, normal_long_max_value+anomaly_data_range)
	else:
		normal_data.latitude = float('inf')
		normal_data.longitude = float('inf')
	
	normal_data.status.status =-1
	return normal_data
	



if __name__ == '__main__':
	# initialize rosnode
	rospy.init_node('attack_gps', anonymous=True)
	# get all the parameters
	publish_rate = rospy.get_param('/attack_gps/publish_rate')
	sensor_attack_type = rospy.get_param('/attack_gps/sensor_attack_type')
	outlier_queue_size = rospy.get_param('/attack_gps/outlier_queue_size')
	
	if (sensor_attack_type == 'similar_values'):
		normal_lat_min_value = rospy.get_param('/attack_gps/similar_values_attack/normal_lat_min_value')
		normal_lat_max_value = rospy.get_param('/attack_gps/similar_values_attack/normal_lat_max_value')
		normal_long_min_value = rospy.get_param('/attack_gps/similar_values_attack/normal_long_min_value')
		normal_long_max_value = rospy.get_param('/attack_gps/similar_values_attack/normal_long_max_value')
		anomaly_data_range = rospy.get_param('/attack_gps/similar_values_attack/anomaly_data_range')
		
	try:
		# create publisher and subscriber
		# create pub/sub of Dataspeed's topic (/vehicle/perfect_gps/enhanced_fix)
		pub_original = rospy.Publisher('/vehicle/perfect_gps/enhanced_fix', GPSFix, queue_size=outlier_queue_size)
		rospy.Subscriber('/vehicle/perfect_gps/enhanced_fix', GPSFix, get_normal_GPSFix_callback)
		# set the rate
		rate = rospy.Rate(publish_rate)
		while not rospy.is_shutdown():
			attack_data = create_anomalous_GPSFix(sensor_attack_type)
			pub_original.publish(attack_data)
			rospy.loginfo("anomalous data published!")
			rate.sleep()
	except rospy.ROSInterruptException:
		pass