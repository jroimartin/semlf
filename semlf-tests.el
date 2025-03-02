;;; semlf-tests.el --- Test suite for semlf -*- lexical-binding: t -*-

;; Copyright (C) 2025 Roi Martin

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

;;; Code:

(require 'ert)
(require 'ert-x)
(require 'semlf)

(ert-deftest semlf-fill-paragraph-function-test ()
  "Set `fill-paragraph-function' and fill paragraph."
  (ert-test-erts-file (ert-resource-file "semlf-fill-paragraph-function.erts")
                      (lambda ()
			(setq-local fill-paragraph-function #'semlf-fill-paragraph)
			(fill-paragraph))))

(ert-deftest semlf-sentence-end-double-space-test ()
  "Set `sentence-end-double-space'."
  (ert-test-erts-file (ert-resource-file "semlf-sentence-end-double-space.erts")
                      (lambda ()
			(setq-local sentence-end-double-space t)
			(semlf-fill-paragraph)
			(forward-paragraph)
			(setq-local sentence-end-double-space nil)
			(semlf-fill-paragraph))))

(ert-deftest semlf-fill-column-test ()
  "Set `fill-column'."
  (ert-test-erts-file (ert-resource-file "semlf-fill-column.erts")
                      (lambda ()
			(setq-local fill-column 70)
			(semlf-fill-paragraph)
			(forward-paragraph)
			(setq-local fill-column 35)
			(semlf-fill-paragraph))))

(ert-deftest semlf-align-test ()
  "Fill and align paragraph."
  (ert-test-erts-file (ert-resource-file "semlf-align.erts")
                      (lambda ()
			(semlf-fill-paragraph 'justify))))

(ert-deftest semlf-second-paragraph-test ()
  "Fill second paragraph."
  (ert-test-erts-file (ert-resource-file "semlf-second-paragraph.erts")
                      (lambda ()
			(forward-paragraph)
			(semlf-fill-paragraph))))

(ert-deftest semlf-last-paragraph-test ()
  "Fill last paragraph."
  (ert-test-erts-file (ert-resource-file "semlf-last-paragraph.erts")
                      (lambda ()
			(goto-char (point-max))
			(semlf-fill-paragraph))))

(ert-deftest semlf-fill-prefix-test ()
  "Insert fill prefix."
  (ert-test-erts-file (ert-resource-file "semlf-fill-prefix.erts")
                      (lambda ()
			(semlf-fill-paragraph))))

(ert-deftest semlf-fill-twice-test ()
  "Fill paragraph twice."
  (ert-test-erts-file (ert-resource-file "semlf-fill-twice.erts")
                      (lambda ()
			(goto-char (point-min))
			(semlf-fill-paragraph)
			(goto-char (point-min))
			(semlf-fill-paragraph))))

(ert-deftest semlf-punctuation-marks-test ()
  "Insert newline after period, exclamation mark and question mark."
  (ert-test-erts-file (ert-resource-file "semlf-punctuation-marks.erts")
                      (lambda ()
			(semlf-fill-paragraph))))

(ert-deftest semlf-emacs-lisp-mode-test ()
  "Fill `emacs-lisp-mode' comment."
  (ert-test-erts-file (ert-resource-file "semlf-emacs-lisp-mode.erts")
                      (lambda ()
			(emacs-lisp-mode)
			(semlf-fill-paragraph))))

(ert-deftest semlf-c-mode-test ()
  "Fill `c-mode' comment."
  (ert-test-erts-file (ert-resource-file "semlf-c-mode.erts")
                      (lambda ()
			(c-mode)
			(semlf-fill-paragraph))))

(ert-deftest semlf-org-mode-test ()
  "Fill `org-mode' paragraph."
  (ert-test-erts-file (ert-resource-file "semlf-org-mode.erts")
                      (lambda ()
			(org-mode)
			(semlf-fill-paragraph))))

;;; semlf-tests.el ends here
