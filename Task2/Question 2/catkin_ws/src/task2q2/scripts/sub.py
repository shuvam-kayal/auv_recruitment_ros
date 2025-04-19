#!/usr/bin/env python3
import rospy
import cv2
from sensor_msgs.msg import Image
from cv_bridge import CvBridge

def image_callback(msg):
    bridge = CvBridge()
    try:
        cv_image = bridge.imgmsg_to_cv2(msg, "mono8")
        cv2.imshow("Edge Detection Subscriber", cv_image)
        cv2.waitKey(1)
    except Exception as e:
        rospy.logerr(e)

def image_subscriber():
    rospy.init_node('image_subscriber')
    rospy.Subscriber('edge_detection', Image, image_callback)
    rospy.spin()
    cv2.destroyAllWindows()

if __name__ == '__main__':
    image_subscriber()