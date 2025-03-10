;;; semlf.el --- Format documents using semantic linefeeds -*- lexical-binding: t -*-

;; Copyright (C) 2025 Free Software Foundation, Inc.

;; Author: Roi Martin <jroi.martin@gmail.com>
;; Maintainer: Roi Martin <jroi.martin@gmail.com>
;; URL: https://github.com/jroimartin/semlf
;; Version: 0.1
;; Package-Requires: ((emacs "29.1"))
;; Keywords: convenience

;; This file is NOT part of GNU Emacs.

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; SemLF helps format documents using semantic linefeeds.

;;; Code:

;;;###autoload
(defun semlf-fill-paragraph (&optional justify)
  "Fill paragraph at or after point using semantic linefeeds.

This function ensures that a newline character follows every
sentence, as punctuated by a period (.), exclamation mark (!), or
question mark (?).

If JUSTIFY is non-nil (interactively, with prefix argument),
justify as well."
  (interactive "P")
  (save-excursion
    (save-restriction
      (let ((end (progn (fill-forward-paragraph 1) (point)))
	    (start (progn (fill-forward-paragraph -1) (beginning-of-line) (point)))
	    pfx)
	(narrow-to-region start end)
	(while (< (point) (point-max))
	  (setq pfx (or (fill-region-as-paragraph
			 (progn (forward-word) (beginning-of-line) (point))
			 (progn (forward-sentence) (point))
			 justify)
			""))
	  (when (> (point) (line-beginning-position))
	    (delete-horizontal-space)
	    (newline)
	    (insert pfx))))))
  t)

(provide 'semlf)

;;; semlf.el ends here
