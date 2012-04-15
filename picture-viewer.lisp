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
	   (incf count)))))

(defun picture-viewer ()
  "Run the picture-viewer application"
  [Application.EnableVisualStyles]
  #-allegro
  [Application.SetCompatibleTextRenderingDefault nil]
  [Application.Run (new-form1)])

(disable-rdnzl-syntax)
