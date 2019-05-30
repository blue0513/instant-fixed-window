;;; instant-fixed-window

;; Copyright (C) 2019- blue0513

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program; if not, write to the Free Software
;; Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA

;; Author: blue0513
;; URL: https://github.com/blue0513/instant-fixed-window
;; Version: 0.1.0

;;; Commentary:

;; Edit your init.el
;;
;; (require 'instant-fixed-window)
;;

;;; Code:

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

;; * provide

(provide 'instant-fixed-window)

;;; instant-fixed-window.el ends here
