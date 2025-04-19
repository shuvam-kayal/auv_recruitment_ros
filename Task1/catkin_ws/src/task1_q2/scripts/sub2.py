#!/usr/bin/env python3
import rospy
from std_msgs.msg import Int32

def Receiver():
    rospy.init_node('receiver_node')
    rospy.Subscriber('/updated_topic', Int32, callback)
    rospy.spin()

def callback(msg):
    new_num = msg.data + 5
    rospy.loginfo(f"Received: {msg.data}\nOutput: {new_num}")

if __name__ == '__main__':
    Receiver()