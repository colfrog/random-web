(in-package :random-web)

(defun get-random-number (n)
  "Returns a random number of n bits"
  (with-open-file (stream "/dev/random" :direction :input
			  :element-type '(unsigned-byte 8))
    (let* ((first-byte-bits (mod n 8))
	   (num-bytes (ceiling (/ n 8)))
	   (random-number 0))
      (do ((i 0 (1+ i))
	   (byte (read-byte stream) (read-byte stream)))
	  ((or (null byte) (>= i num-bytes))
	   (when (not (null byte)) random-number))
	(when (= i 0)
	  (let ((mask 0))
	    (dotimes (k first-byte-bits)
	      (setf mask (logior mask (ash 1 k))))
	    (setf byte (logand byte mask))))
	(setf random-number (logior (ash random-number 8) byte))))))
	
