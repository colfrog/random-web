(asdf:defsystem random-web
  :version "0.0.1"
  :author "Laurent Cimon <laurent@nilio.ca>"
  :maintainer "Laurent Cimon <laurent@nilio.ca>"
  :license "bsd-2-clause"
  :description "Random number generator microservice"
  :components ((:file "package")
	       (:file "random")
	       (:file "server"))
  :depends-on (#:hunchentoot)
  :build-operation "program-op"
  :build-pathname "random-web"
  :entry-point "random-web:start-server")
