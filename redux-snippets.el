;; -*- lexical-binding: t -*-

;;; redux-snippets.el --- Redux snippets for yasnippet

;; Copyright (c) 2019 Seong Yong-ju.

;; Author: Seong Yong-ju <sei40kr@gmail.com>
;; Version: 1.0.0
;; Package-Requires: (yasnippet s)
;; Keywords: redux, yasnippet, snippets
;; URL: https://github.com/sei40kr/redux-snippets

;;; Commentary:

;; Redux snippets for yasnippet.

;;; Code:

(require 'yasnippet)

(defconst redux-snippets-dir
  (expand-file-name
   "snippets"
   (file-name-directory
    (cond
     (load-in-progress load-file-name)
     ((and (boundp 'byte-compile-current-file) byte-compile-current-file)
      byte-compile-current-file)
     (:else (buffer-file-name))))))

;;;###autoload
(defun redux-snippets//initialize ()
  (add-to-list 'yas-snippet-dirs 'redux-snippets-dir t)
  (yas-load-directory redux-snippets-dir t))

(defun redux-snippets//file-class-name ()
  (file-name-nondirectory (file-name-sans-extension (buffer-file-name))))

(defun redux-snippets//container-component-name ()
  (s-chop-suffix "Container" (redux-snippets//file-class-name)))

(eval-after-load 'yasnippet
  '(redux-snippets//initialize))

(provide 'redux-snippets)

;;; redux-snippets ends here
