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

(ert-deftest semlf-test-fill-paragraph ()
  "Fill paragraph."
  (ert-test-erts-file (ert-resource-file "semlf-fill-paragraph.erts")
                      (lambda ()
			(semlf-fill-paragraph))))

(ert-deftest semlf-test-fill-paragraph-function ()
  "Set `fill-paragraph-function' and fill paragraph."
  (ert-test-erts-file (ert-resource-file "semlf-fill-paragraph-function.erts")
                      (lambda ()
			(setq-local fill-paragraph-function #'semlf-fill-paragraph)
			(fill-paragraph))))

(ert-deftest semlf-test-justify ()
  "Fill and justify paragraph."
  (ert-test-erts-file (ert-resource-file "semlf-justify.erts")
                      (lambda ()
			(semlf-fill-paragraph 'justify))))

(ert-deftest semlf-test-sentence-end-double-space ()
  "Set `sentence-end-double-space'."
  (ert-test-erts-file (ert-resource-file "semlf-sentence-end-double-space.erts")
                      (lambda ()
			(setq-local sentence-end-double-space nil)
			(semlf-fill-paragraph))))

(ert-deftest semlf-test-fill-column ()
  "Set `fill-column'."
  (ert-test-erts-file (ert-resource-file "semlf-fill-column.erts")
                      (lambda ()
			(setq-local fill-column 35)
			(semlf-fill-paragraph))))

(ert-deftest semlf-test-punctuation-marks ()
  "Insert newline after period, exclamation mark and question mark."
  (ert-test-erts-file (ert-resource-file "semlf-punctuation-marks.erts")
                      (lambda ()
			(semlf-fill-paragraph))))

(ert-deftest semlf-test-fill-twice ()
  "Fill paragraph twice."
  (ert-test-erts-file (ert-resource-file "semlf-fill-twice.erts")
                      (lambda ()
			(goto-char (point-min))
			(semlf-fill-paragraph)
			(goto-char (point-min))
			(semlf-fill-paragraph))))

(ert-deftest semlf-test-list ()
  "Fill list."
  (ert-test-erts-file (ert-resource-file "semlf-list.erts")
                      (lambda ()
			(semlf-fill-paragraph))))

(ert-deftest semlf-test-indented-block ()
  "Fill indented block."
  (ert-test-erts-file (ert-resource-file "semlf-indented-block.erts")
                      (lambda ()
			(semlf-fill-paragraph))))

(ert-deftest semlf-test-emacs-lisp-mode ()
  "Fill `emacs-lisp-mode' paragraph in comment."
  (ert-test-erts-file (ert-resource-file "semlf-emacs-lisp-mode.erts")
                      (lambda ()
			(emacs-lisp-mode)
			(semlf-fill-paragraph))))

(ert-deftest semlf-test-c-mode ()
  "Fill `c-mode' paragraph in comment."
  (ert-test-erts-file (ert-resource-file "semlf-c-mode.erts")
                      (lambda ()
			(c-mode)
			(semlf-fill-paragraph))))

(ert-deftest semlf-test-org-mode ()
  "Fill `org-mode' paragraph."
  (ert-test-erts-file (ert-resource-file "semlf-org-mode.erts")
                      (lambda ()
			(org-mode)
			(semlf-fill-paragraph))))

(ert-deftest semlf-test-markdown-mode ()
  "Fill `markdown-mode' paragraph."
  (skip-unless (functionp 'markdown-mode))
  (ert-test-erts-file (ert-resource-file "semlf-markdown-mode.erts")
                      (lambda ()
			(markdown-mode)
			(semlf-fill-paragraph))))

;;; semlf-tests.el ends here
