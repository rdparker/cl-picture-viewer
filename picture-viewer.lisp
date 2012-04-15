;;;; picture-viewer.lisp

(in-package #:picture-viewer)

(enable-rdnzl-syntax)

(import-types "System.Windows.Forms" "Application")

(use-namespace "System.Windows.Forms")

(defun picture-viewer ()
  "Run the picture-viewer application"
  [Application.EnableVisualStyles]
  #-allegro
  [Application.SetCompatibleTextRenderingDefault nil]
  [Application.Run (new-form1)])

(disable-rdnzl-syntax)
