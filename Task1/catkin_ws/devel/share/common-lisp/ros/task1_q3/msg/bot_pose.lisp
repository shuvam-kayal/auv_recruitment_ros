; Auto-generated. Do not edit!


(cl:in-package task1_q3-msg)


;//! \htmlinclude bot_pose.msg.html

(cl:defclass <bot_pose> (roslisp-msg-protocol:ros-message)
  ((x
    :reader x
    :initarg :x
    :type cl:float
    :initform 0.0)
   (y
    :reader y
    :initarg :y
    :type cl:float
    :initform 0.0)
   (direction
    :reader direction
    :initarg :direction
    :type cl:string
    :initform ""))
)

(cl:defclass bot_pose (<bot_pose>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <bot_pose>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'bot_pose)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name task1_q3-msg:<bot_pose> is deprecated: use task1_q3-msg:bot_pose instead.")))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <bot_pose>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader task1_q3-msg:x-val is deprecated.  Use task1_q3-msg:x instead.")
  (x m))

(cl:ensure-generic-function 'y-val :lambda-list '(m))
(cl:defmethod y-val ((m <bot_pose>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader task1_q3-msg:y-val is deprecated.  Use task1_q3-msg:y instead.")
  (y m))

(cl:ensure-generic-function 'direction-val :lambda-list '(m))
(cl:defmethod direction-val ((m <bot_pose>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader task1_q3-msg:direction-val is deprecated.  Use task1_q3-msg:direction instead.")
  (direction m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <bot_pose>) ostream)
  "Serializes a message object of type '<bot_pose>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'direction))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'direction))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <bot_pose>) istream)
  "Deserializes a message object of type '<bot_pose>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'x) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'y) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'direction) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'direction) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<bot_pose>)))
  "Returns string type for a message object of type '<bot_pose>"
  "task1_q3/bot_pose")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'bot_pose)))
  "Returns string type for a message object of type 'bot_pose"
  "task1_q3/bot_pose")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<bot_pose>)))
  "Returns md5sum for a message object of type '<bot_pose>"
  "9fe0bb04457256f44c3856c153b539c2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'bot_pose)))
  "Returns md5sum for a message object of type 'bot_pose"
  "9fe0bb04457256f44c3856c153b539c2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<bot_pose>)))
  "Returns full string definition for message of type '<bot_pose>"
  (cl:format cl:nil "float32 x~%float32 y~%string direction~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'bot_pose)))
  "Returns full string definition for message of type 'bot_pose"
  (cl:format cl:nil "float32 x~%float32 y~%string direction~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <bot_pose>))
  (cl:+ 0
     4
     4
     4 (cl:length (cl:slot-value msg 'direction))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <bot_pose>))
  "Converts a ROS message object to a list"
  (cl:list 'bot_pose
    (cl:cons ':x (x msg))
    (cl:cons ':y (y msg))
    (cl:cons ':direction (direction msg))
))
