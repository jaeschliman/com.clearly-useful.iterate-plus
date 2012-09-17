;;;; package.lisp

(defpackage #:com.clearly-useful.iterate+
  (:use #:cl
	#:com.clearly-useful.generic-collection-interface
	#:com.clearly-useful.iterator-protocol
	#:iterate)
  (:export
   #:per
   #:of))

