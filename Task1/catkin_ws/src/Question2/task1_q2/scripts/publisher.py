#!/usr/bin/env python3
import rospy
from std_msgs.msg import Int32

def publish_numbers():
    rospy.init_node('publisher_node')
    pub = rospy.Publisher('/org_topic', Int32, queue_size=10)
    rate = rospy.Rate(1)
    
    while not rospy.is_shutdown():
        num = int(input(f"Enter number: "))
        pub.publish(num)
        rospy.loginfo(f"Published: {num}")
        rate.sleep()

if __name__ == '__main__':
    try:
        publish_numbers()
    except rospy.ROSInterruptException:
        pass