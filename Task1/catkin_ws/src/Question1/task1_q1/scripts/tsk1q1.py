#!/usr/bin/env python3

import rospy
from std_msgs.msg import String

class ChatSystem:
    def __init__(self, username):
        self.username = username
        
        # Initializing node
        rospy.init_node('common_node', anonymous=True)
        
        # Publisher and Subscriber on SAME topic
        self.pub = rospy.Publisher('/common_topic', String, queue_size=10)
        self.sub = rospy.Subscriber('/common_topic', String, self.receive_msg)
        
        rospy.loginfo(f"{username} joined the shared chat")

    def receive_msg(self, msg):
        # Filter out own messages
        if not msg.data.startswith(f"{self.username}:"):
            print(f"\n[Chat] {msg.data}\n[{self.username}]: ", end='', flush=True)

    def run(self):
        try:
            while not rospy.is_shutdown():
                msg = input(f"[{self.username}]: ")
                self.pub.publish(f"{self.username}: {msg}")
        except KeyboardInterrupt:
            rospy.loginfo(f"{self.username} left the chat")

if __name__ == '__main__':
    user = input("Enter your username: ")
    chat = ChatSystem(user)
    chat.run()