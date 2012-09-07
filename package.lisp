;;;; package.lisp

(defpackage #:com.clearly-useful.iterate+
  (:use #:cl
	#:com.clearly-useful.sequence-protocol
	#:com.clearly-useful.iterator-protocol
	#:iterate)
  (:export
   #:per
   #:of))

