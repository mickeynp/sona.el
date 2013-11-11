;;; sona.el --- wrapper for Sona, a Python-aware search tool

;; Copyright (C) 2013  Mickey Petersen

;; Author: Mickey Petersen <mickey@fyeah.org>
;; Keywords: languages, tools
;; Version: 0.1
;; Website: http://www.github.com/mickeynp/sona.el

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Installation

;; Install package
;; (package-install 'sona)
;;
;;; Usage
;;
;; To use, run `sona' and input your Sona query. A new buffer named
;; `*Sona*' will appear. It works identically to the standard `grep'
;; buffers, so the usual hotkeys like `M-g M-n' and `M-g M-p' work
;; great.
;;

;;; Commentary:

;; This is a simple wrapper for my Python-aware search tool, Sona. If
;; you don't know what Sona is, and you use Python in your day-to-day
;; life, I suggest you visit
;;
;; http://www.github.com/mickeynp/sona/
;;
;; To learn more about it.
;;
;; This simple wrapper re-purposes `grep-mode' so it works with Sona
;; and with `vc-git' automatically.

;;; Code:

(defun sona--compilation-name-mode (mode-name)
  "Utility function that names the `compile' mode."
  "*Sona*")

;;;###autoload
(defun sona (query)
  (interactive "sSona Query: ")
  ;; if `vc-responsible-backend' returns a Git backend then we can
  ;; skip the directory stuff.
  (let* ((sona-query (format "sona --output-format=grep %s"
                            (shell-quote-argument query)))
         (buffer-dir (file-name-directory (buffer-file-name)))
         (default-directory (vc-call-backend
                    (vc-responsible-backend buffer-dir)
                    'root buffer-dir)))
    (if (eq (vc-responsible-backend (buffer-file-name)) 'Git)
       (compilation-start sona-query 'grep-mode
                          #'sona--compilation-name-mode))))



(provide 'sona)
;;; sona.el ends here
