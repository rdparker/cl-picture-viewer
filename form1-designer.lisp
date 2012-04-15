;;; -*- Mode:Lisp; Syntax:ANSI-Common-Lisp; Coding:iso-8859-1 -*-

(in-package #:picture-viewer)

(enable-rdnzl-syntax)

(import-type "System.ComponentModel.ISupportInitialize"
	     (load-assembly "System"))
(import-type "System.EventHandler" (load-assembly "mscorlib"))

(import-types "System.Drawing" "Point" "Size" "SizeF")
(import-types "System.Windows.Forms" "BorderStyle" "Button" "CheckBox"
	      "ColorDialog" "ColumnStyle" "DialogResult" "DockStyle"
	      "FlowLayoutPanel" "FlowDirection" "OpenFileDialog"
	      "PictureBox" "RowStyle" "SizeType"
	      "TableLayoutColumnStyleCollection"
	      "TableLayoutControlCollection" "TableLayoutPanel")

(use-namespace "System")
(use-namespace "System.ComponentModel")
(use-namespace "System.Drawing")
(use-namespace "System.Windows.Forms")

(let ((table-layout-panel-1)
      (picture-box-1)
      (check-box-1)
      (flow-layout-panel-1)
      (show-button)
      (clear-button)
      (background-button)
      (close-button)
      (open-file-dialog-1)
      (color-dialog-1))

  (defun form1-initialize-component (form)
    "Add the various UI elements to FORM."
    (setf table-layout-panel-1 (new "TableLayoutPanel")
	  picture-box-1 (new "PictureBox")
	  check-box-1 (new "CheckBox")
	  flow-layout-panel-1 (new "FlowLayoutPanel")
	  show-button (new "Button")
	  clear-button (new "Button")
	  background-button (new "Button")
	  close-button (new "Button")
	  open-file-dialog-1 (new "OpenFileDialog")
	  color-dialog-1 (new "ColorDialog"))
    [SuspendLayout table-layout-panel-1]
    ;; This cast seems to be a problem.  Let's try without calling BeginInit.
    ;;    [BeginInit (cast picture-box-1 "ISupportInitialize")]
    [SuspendLayout flow-layout-panel-1]
    [SuspendLayout form]

    ;; tableLayoutPanel1
    (setf [%ColumnCount table-layout-panel-1] 2
	  [%Dock table-layout-panel-1] [$DockStyle.Fill]
	  [%Location table-layout-panel-1] (new "Point" 0 0)
	  [%Name table-layout-panel-1] "tableLayoutPanel1"
	  [%RowCount table-layout-panel-1] 2
	  [%Size table-layout-panel-1] (new "Size" 534 312)
	  [%TabIndex table-layout-panel-1] 0)
    (let ((column-styles [%ColumnStyles table-layout-panel-1])
	  (controls [get_Controls table-layout-panel-1])
	  (row-styles [%RowStyles table-layout-panel-1]))
      [Add column-styles (new "ColumnStyle" [$SizeType.Percent] 15)]
      [Add column-styles (new "ColumnStyle" [$SizeType.Percent] 85)]
      [Add row-styles (new "RowStyle" [$SizeType.Percent] 90)]
      [Add row-styles (new "RowStyle" [$SizeType.Percent] 10)]
      [Add controls picture-box-1 0 0]
      [Add controls check-box-1 0 1]
      [Add controls flow-layout-panel-1 1 1])

    ;; pictureBox1
    (setf [%BorderStyle picture-box-1] [$BorderStyle.Fixed3D])
    [SetColumnSpan table-layout-panel-1 picture-box-1 2]
    (setf [%Dock picture-box-1] [$DockStyle.Fill]
	  [%Location picture-box-1] (new "Point" 3 3)
	  [%Name picture-box-1] "pictureBox1"
	  [%Size picture-box-1] (new "Size" 528 274)
	  [%TabIndex picture-box-1] 0
	  [%TabStop picture-box-1] nil)

    ;; checkBox1
    (setf [%AutoSize check-box-1] t
	  [%Location check-box-1] (new "Point" 3 283)
	  [%Name check-box-1] "checkBox1"
	  [%Size check-box-1] (new "Size" 60 17)
	  [%TabIndex check-box-1] 1
	  [%Text check-box-1] "Stretch"
	  [%UseVisualStyleBackColor check-box-1] t)

    ;; flowLayoutPanel1
    (let ((controls [%Controls flow-layout-panel-1]))
      [Add controls show-button]
      [Add controls clear-button]
      [Add controls background-button]
      [Add controls close-button])
    (setf [%Dock flow-layout-panel-1] [$DockStyle.Fill]
	  [%FlowDirection flow-layout-panel-1] [$FlowDirection.RightToLeft]
	  [%Location flow-layout-panel-1] (new "Point" 83 283)
	  [%Name flow-layout-panel-1] "flowLayoutPanel1"
	  [%Size flow-layout-panel-1] (new "Size" 448 26)
	  [%TabIndex flow-layout-panel-1] 2)

    ;; showButton
    (setf [%AutoSize show-button] t
	  [%Location show-button] (new "Point" 357 3)
	  [%Name show-button] "showButton"
	  [%Size show-button] (new "Size" 88 23)
	  [%TabIndex show-button] 0
	  [%Text show-button] "Show a picture"
	  [%UseVisualStyleBackColor show-button] t)

    (defun show-button-click (sender e)
      (declare (ignore sender e))
      "Handle when the Show a picture button is clicked"
      (when [Equals [ShowDialog open-file-dialog-1] [$DialogResult.OK]]
	[Load picture-box-1 [%FileName open-file-dialog-1]]))

    [+Click show-button (new "EventHandler" #'show-button-click)]

    ;; clearButton
    (setf [%AutoSize clear-button] t
	  [%Location clear-button] (new "Point" 257 3)
	  [%Name clear-button] "clearButton"
	  [%Size clear-button] (new "Size" 94 23)
	  [%TabIndex clear-button] 1
	  [%Text clear-button] "Clear the picture"
	  [%UseVisualStyleBackColor clear-button] t)
    [+Click clear-button
	    (new "EventHandler"
		 (lambda (sender e)
		   (declare (ignore sender e))
		   (setf [%Image picture-box-1] (make-null-object "Image"))))]

    ;; backgroundButton
    (setf [%AutoSize background-button] t
	  [%Location background-button] (new "Point" 114 3)
	  [%Name background-button] "backgroundButton"
	  [%Size background-button] (new "Size" 137 23)
	  [%TabIndex background-button] 2
	  [%Text background-button] "Set the background color"
	  [%UseVisualStyleBackColor background-button] t)
    [+Click background-button
	    (new "EventHandler"
		 (lambda (sender e)
		   (declare (ignore sender e))
		   (when [Equals [ShowDialog color-dialog-1]
				 [$DialogResult.OK]]
		     (setf [%BackColor picture-box-1]
			   [%Color color-dialog-1]))))]

    ;; closeButton
    (setf [%AutoSize close-button] t
	  [%Location close-button] (new "Point" 33 3)
	  [%Name close-button] "closeButton"
	  [%Size close-button] (new "Size" 75 23)
	  [%TabIndex close-button] 3
	  [%Text close-button] "Close"
	  [%UseVisualStyleBackColor close-button] t)

    ;; openFileDialog1
    (setf [%FileName open-file-dialog-1] "openFileDialog1"
	  [%Filter open-file-dialog-1]
	  "JPEG Files (*.jpg)|*.jpg|PNG Files (*.png)|*.png|BMP Files (*.bmp)|*.bmp|All files (*.*)|*.*"
	  [%Title open-file-dialog-1] "Select a picture file")

    ;; Form1
    [Add [%Controls form] table-layout-panel-1]
    (setf [%AcceptButton form] show-button
	  [%AutoScaleDimensions form] (new "SizeF" 6 13)
	  [%CancelButton form] close-button
	  [%ClientSize form] (new "Size" 534 312)
	  [%Name form] "Form1"
	  [%Text form] "Picture Viewer")
    [ResumeLayout table-layout-panel-1 nil]
    [PerformLayout table-layout-panel-1]
    [ResumeLayout flow-layout-panel-1 nil]
    [PerformLayout flow-layout-panel-1]
    [ResumeLayout form]))

(disable-rdnzl-syntax)
