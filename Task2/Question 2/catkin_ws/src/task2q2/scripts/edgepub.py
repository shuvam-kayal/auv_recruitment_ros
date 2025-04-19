#!/usr/bin/env python3
import rospy
import cv2
from sensor_msgs.msg import Image
from cv_bridge import CvBridge

def camera_publisher():
    rospy.init_node('edge_publisher', anonymous=True)
    pub = rospy.Publisher('edge_detection', Image, queue_size=10)
    bridge = CvBridge()
    
    cap = cv2.VideoCapture(0)
    if not cap.isOpened():
        rospy.logerr("Cannot open camera!")
        return
    
    rate = rospy.Rate(10)  # 10Hz
    while not rospy.is_shutdown():
        ret, frame = cap.read()
        if not ret:
            rospy.logwarn("Frame read failed")
            continue
            
        # Edge detection
        gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
        edges = cv2.Canny(gray, 100, 200)
        
        # Convert to ROS message and publish
        ros_image = bridge.cv2_to_imgmsg(edges, "mono8")
        pub.publish(ros_image)
        
        rate.sleep()
        
    cap.release()

if __name__ == '__main__':
    try:
        camera_publisher()
    except rospy.ROSInterruptException:
        pass