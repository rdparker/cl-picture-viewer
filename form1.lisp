;;; -*- Mode:Lisp; Syntax:ANSI-Common-Lisp; Coding:iso-8859-1 -*-

(in-package #:picture-viewer)

(defun new-form1 ()
  "Create a new Form1 object"
  (let ((form1 (new "Form")))
    (form1-initialize-component form1)
    form1))
