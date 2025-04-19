#!/usr/bin/env python3
import rospy
from std_msgs.msg import String
from task1_q3.msg import bot_pose

class BotController:
    def __init__(self):
        rospy.init_node('bot_controller', anonymous=True)
        self.pose_pub = rospy.Publisher('bot_pose', bot_pose, queue_size=10)
        rospy.Subscriber('bot_command', String, self.handle_command)
        
        # Initial state
        self.x = 0.0
        self.y = 0.0
        self.direction = "north"  # Initial facing direction
        
        # State machine transitions for turning
        self.turn_left_map = {
            "north": "west",
            "west": "south",
            "south": "east",
            "east": "north"
        }
        
        self.turn_right_map = {
            "north": "east",
            "east": "south",
            "south": "west",
            "west": "north"
        }

    def handle_command(self, msg):
        cmd = msg.data
        if cmd == "forward":
            self.move_forward()
        elif cmd == "turn_left":
            self.direction = self.turn_left_map[self.direction]
        elif cmd == "turn_right":
            self.direction = self.turn_right_map[self.direction]
        
        self.publish_pose()

    def move_forward(self):
        if self.direction == "north":
            self.y += 1
        elif self.direction == "south":
            self.y -= 1
        elif self.direction == "east":
            self.x += 1
        elif self.direction == "west":
            self.x -= 1

    def publish_pose(self):
        pose = bot_pose()
        pose.x = self.x
        pose.y = self.y
        pose.direction = self.direction
        self.pose_pub.publish(pose)
        rospy.loginfo(f"Pose: x={pose.x}, y={pose.y}, facing={pose.direction}")

if __name__ == '__main__':
    try:
        controller = BotController()
        rospy.spin()
    except rospy.ROSInterruptException:
        pass