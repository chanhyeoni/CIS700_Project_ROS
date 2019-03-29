;; Auto-generated. Do not edit!


(when (boundp 'save_data::GPS)
  (if (not (find-package "SAVE_DATA"))
    (make-package "SAVE_DATA"))
  (shadow 'GPS (find-package "SAVE_DATA")))
(unless (find-package "SAVE_DATA::GPS")
  (make-package "SAVE_DATA::GPS"))

(in-package "ROS")
;;//! \htmlinclude GPS.msg.html


(defclass save_data::GPS
  :super ros::object
  :slots (_latitude _longitude ))

(defmethod save_data::GPS
  (:init
   (&key
    ((:latitude __latitude) 0.0)
    ((:longitude __longitude) 0.0)
    )
   (send-super :init)
   (setq _latitude (float __latitude))
   (setq _longitude (float __longitude))
   self)
  (:latitude
   (&optional __latitude)
   (if __latitude (setq _latitude __latitude)) _latitude)
  (:longitude
   (&optional __longitude)
   (if __longitude (setq _longitude __longitude)) _longitude)
  (:serialization-length
   ()
   (+
    ;; float64 _latitude
    8
    ;; float64 _longitude
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _latitude
       (sys::poke _latitude (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _longitude
       (sys::poke _longitude (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _latitude
     (setq _latitude (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _longitude
     (setq _longitude (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get save_data::GPS :md5sum-) "680c6dc7da65a2421a822205dcbdb600")
(setf (get save_data::GPS :datatype-) "save_data/GPS")
(setf (get save_data::GPS :definition-)
      "float64 latitude
float64 longitude

")



(provide :save_data/GPS "680c6dc7da65a2421a822205dcbdb600")


