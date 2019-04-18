#!/usr/bin/env python
# Software License Agreement (BSD License)
#
# Copyright (c) 2019, Chang Hyun Lee
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met:
#
#  * Redistributions of source code must retain the above copyright
#    notice, this list of conditions and the following disclaimer.
#  * Redistributions in binary form must reproduce the above
#    copyright notice, this list of conditions and the following
#    disclaimer in the documentation and/or other materials provided
#    with the distribution.
#  * Neither the name of Willow Garage, Inc. nor the names of its
#    contributors may be used to endorse or promote products derived
#    from this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
# LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
# FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
# COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
# INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
# BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
# LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
# CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
# LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
# ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
# POSSIBILITY OF SUCH DAMAGE.
#
# Revision $Id$

'''
	attack_gps republises manually generated, anomolous data to the same topic 
	/vehicle/perfect_gps/enhanced_fix from dataspeed_dbw_gazebo_demo. In detail,
	attack_gps creates the anomalous data periodically.
'''

import rospy
from std_msgs.msg import String
from gps_common.msg import GPSFix


normal_data = GPSFix()	
'''
	a callback function that assigns a subcribed GPS data from topic (/vehicle/perfect_gps/enhanced_fix) to normal_data, which will be used to create fake data
'''
def get_normal_GPSFix_callback(data):
	normal_data = data


''' 
	a function that returns a fake GPS data with wrong, anomalous latitude and longitude.
	In detail, the function takes parameter data suscribed from the topic and
'''
def create_anomalous_GPSFix(command, data):
	# copy 
	if (command == 'zero_lat_long'):
		data.latitude = 0
		data.longitude = 0
	else:
		data.latitude = float('inf')
		data.longitude = float('inf')
		
	return data
	



if __name__ == '__main__':
	# initialize rosnode
	rospy.init_node('attack_gps', anonymous=True)
	# get all the parameters
	publish_rate = rospy.get_param('/attack_gps/publish_rate')
	sensor_attack_type = rospy.get_param('/attack_gps/sensor_attack_type')
	
    	try:
		# create publisher and subscriber
		pub = rospy.Publisher('/vehicle/perfect_gps/enhanced_fix', GPSFix, queue_size=10)
		rospy.Subscriber('/vehicle/perfect_gps/enhanced_fix', GPSFix, get_normal_GPSFix_callback)
		# set the rate
		rate = rospy.Rate(publish_rate)
		while not rospy.is_shutdown():
			attack_data = create_anomalous_GPSFix(sensor_attack_type, normal_data)
			pub.publish(attack_data)
			rospy.loginfo("anomalous data published!")
			rate.sleep()
	except rospy.ROSInterruptException:
		pass


