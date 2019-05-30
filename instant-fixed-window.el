(require 'cl-lib)

(defun ifw--set-window-height-fixed! ()
  (setq window-size-fixed 'height))

(defun ifw--set-window-width-fixed! ()
  (setq window-size-fixed 'width))

(defun ifw--check-window-has-fixed (width-check)
  (let* ((current-window (get-buffer-window))
         (delta 1)
         (horizontal width-check)
         (is-fixed
          (eq 0 (window-resizable current-window delta horizontal))))
    is-fixed))

(defun ifw--check-window-has-fixed-width ()
  (let* ((width-check t))
    (ifw--check-window-has-fixed width-check)))

(defun ifw--check-window-has-fixed-height ()
  (let* ((width-check nil))
    (ifw--check-window-has-fixed width-check)))

(defun ifw--adjust-window-width ()
  (if (ifw--check-window-has-fixed-width)
      (setq window-size-fixed nil)
    (ifw--set-window-width-fixed!)))

(defun ifw--adjust-window-height ()
  (if (ifw--check-window-has-fixed-height)
      (setq window-size-fixed nil)
    (ifw--set-window-height-fixed!)))

(cl-defun instant-fixed-window-with(&key width height)
  (if width (ifw--adjust-window-width))
  (if height (ifw--adjust-window-height)))

(defun instant-fixed-window-width ()
  (interactive)
  (instant-fixed-window-with :width t))

(defun instant-fixed-window-height ()
  (interactive)
  (instant-fixed-window-with :height t))
