;;;; picture-viewer.asd

(asdf:defsystem #:picture-viewer
  :serial t
  :depends-on (#:rdnzl)
  :components ((:file "package")
	       (:file "picture-viewer")
	       (:file "form1-designer")
	       (:file "form1")))
