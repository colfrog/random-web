(in-package :random-web)

(defvar *server* nil)
(defvar *acceptor* nil)
(defvar *port* 4444)

(defun start-server (&key (wait t))
  (when (null *server*)
    (setf *server* (make-instance 'easy-acceptor :port *port*)))
  (setf *acceptor* (start *server*))
  (when wait
    (sb-thread:join-thread
     (find-if
      (lambda (thread) (string= (sb-thread:thread-name thread) "hunchentoot-listener-*:4444"))
      (sb-thread:list-all-threads)))))

(define-easy-handler (main-page :uri "/") (bits)
  (let* ((default-n 128)
	 (n (if bits (parse-integer bits :junk-allowed t) default-n)))
    (setf (content-type*) "text/plain")
    (if (> n (expt 2 17))
	(format nil "Please keep your requests under ~d bits." (expt 2 17))
	(format nil "~d" (get-random-number n)))))
