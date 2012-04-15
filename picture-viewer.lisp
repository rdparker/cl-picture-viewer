;;;; picture-viewer.lisp

(in-package #:picture-viewer)

(enable-rdnzl-syntax)

(import-types "System.Windows.Forms"
	      "Application" "Form" "Button" "ListBox"
	      "MessageBox" "MessageBoxButtons" "DialogResult")

(import-type "System.EventHandler" (load-assembly "mscorlib"))

(use-namespace "System.Windows.Forms")
(use-namespace "System")

(let ((listbox1 (new "ListBox")))
  (defun button1-click (sender e)
    (declare (ignore sender e))
    "Handle the Click event for button1"
    (let ((count 1))
      (loop while [Equals [MessageBox.Show "Exit application?" ""
					   [$MessageBoxButtons.YesNo]]
			  [$DialogResult.No]]
	 do [Add [%Items listbox1] count]
	   (incf count))))

  (defun new-form1 ()
    "Create a new Form1 object"
    (let* ((form1 (new "Form"))
	   (button1 (new "Button"))
	   (controls [%Controls form1])
	   (click (new "EventHandler" #'button1-click)))
      (setf [%Left button1] 200
	    [%Text button1] "Exit")
      [Add controls button1]
      [Add controls listbox1]
      [+Click button1 click]
      form1)))

(defun picture-viewer ()
  "Run the picture-viewer application"
  [Application.Run (new-form1)])

(disable-rdnzl-syntax)
;;; "picture-viewer" goes here. Hacks and glory await!
