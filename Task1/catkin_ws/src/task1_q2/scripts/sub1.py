#!/usr/bin/env python3
import rospy
from std_msgs.msg import Int32

class Amplifier:
    def __init__(self):
        rospy.init_node('amplifier_node')
        self.sub = rospy.Subscriber('/org_topic', Int32, self.callback)
        self.pub = rospy.Publisher('/updated_topic', Int32, queue_size=10)
        
    def callback(self, num):
        new_num = num.data * 10 
        self.pub.publish(new_num)
        rospy.loginfo(f"Amplified {num.data} → {new_num}")

if __name__ == '__main__':
    rec = Amplifier()
    rospy.spin()