;;;; com.clearly-useful.iterate+.asd

(asdf:defsystem #:com.clearly-useful.iterate+
  :serial t
  :description "iterate extensions for the sequence and iterator protocols"
  :author "Jason Aeschliman <j.aeschliman@gmail.com>"
  :license "revised BSD"
  :depends-on (#:com.clearly-useful.protocols
               #:com.clearly-useful.sequence-protocol
               #:com.clearly-useful.iterator-protocol
               #:iterate)
  :components ((:file "package")
               (:file "com.clearly-useful.iterate+")))

