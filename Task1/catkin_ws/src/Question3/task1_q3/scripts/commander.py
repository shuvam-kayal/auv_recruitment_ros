#!/usr/bin/env python3
import rospy
from std_msgs.msg import String

def bot_commander():
    rospy.init_node('bot_commander', anonymous=True)
    pub = rospy.Publisher('bot_command', String, queue_size=10)
    rate = rospy.Rate(1)

    while not rospy.is_shutdown():
        cmd = input("Enter command (forward/turn_left/turn_right/exit): ").strip().lower()
        
        if cmd == "exit":
            break
        elif cmd in ["forward", "turn_left", "turn_right"]:
            pub.publish(cmd)
            rospy.loginfo(f"Published: {cmd}")
        else:
            print("Invalid command!")
        rate.sleep()

if __name__ == '__main__':
    try:
        bot_commander()
    except rospy.ROSInterruptException:
        pass