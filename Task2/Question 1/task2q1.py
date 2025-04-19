import cv2

cap = cv2.VideoCapture(1)

if not cap.isOpened():
    print("Error: Webcam not accessible!")
else:
    print("Webcam working! Press 'q' to quit.")
    while True:
        ret, frame = cap.read()
        if not ret:
            break
        cv2.imshow("VMware Webcam Test", frame)
        if cv2.waitKey(1) & 0xFF == ord('q'):
            break
    cap.release()
    cv2.destroyAllWindows()
