;;; redux-snippets.el --- Redux snippets for yasnippet

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

(defun redux-snippets-initialize ()
  (add-to-list 'yas-snippet-dirs 'redux-snippets-dir t)
  (yas-load-directory redux-snippets-dir t))

(eval-after-load 'yasnippet
  '(redux-snippets-initialize))

(provide 'redux-snippets)

;;; redux-snippets ends here
