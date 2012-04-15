;;; -*- Mode:Lisp; Syntax:ANSI-Common-Lisp; Coding:iso-8859-1 -*-

(in-package #:picture-viewer)

(enable-rdnzl-syntax)

(import-type "System.ComponentModel.ISupportInitialize"
	     (load-assembly "System"))
(import-types "System.Drawing" "Point" "Size" "SizeF")
(import-types "System.Windows.Forms" "BorderStyle" "Button" "CheckBox"
	     "ColorDialog" "ColumnStyle" "DockStyle" "FlowLayoutPanel"
	     "OpenFileDialog" "PictureBox" "RowStyle" "SizeType"
	     "TableLayoutColumnStyleCollection"
	     "TableLayoutControlCollection" "TableLayoutPanel")

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
      [Add controls check-box-1 0 1])

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

    ;; Form1
    [Add [%Controls form] table-layout-panel-1]
    (setf [%AutoScaleDimensions form] (new "SizeF" 6 13)
	  [%ClientSize form] (new "Size" 534 312)
	  [%Name form] "Form1"
	  [%Text form] "Picture Viewer")
    [ResumeLayout table-layout-panel-1 nil]
    [PerformLayout table-layout-panel-1]
    [ResumeLayout form]))

(disable-rdnzl-syntax)
