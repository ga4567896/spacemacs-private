;;; packages.el --- Shawn layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2018 Sylvain Benner & Contributors
;;
;; Author:  <Shawn@SHAWN-NB>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `Shawn-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `Shawn/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `Shawn/pre-init-PACKAGE' and/or
;;   `Shawn/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst Shawn-packages
  '(
    youdao-dictionary
    company
    elpy
    ;; company-anaconda
    ;; (company-anaconda :toggle (configuration-layer/package-usedp 'company))
    evil-escape
    ipython-notebook
    ;; google-translate
    )
  )

(defun Shawn/init-youdao-dictionary()
  (use-package youdao-dictionary
    :defer t
    :init
    (spacemacs/set-leader-keys "oy" 'youdao-dictionary-search-at-point+)
    )
  )

(defun Shawn/init-elpy()
  (use-package elpy
    :ensure t
    :init
    (elpy-enable)
    )
  )

(defun Shawn/post-init-evil-escape ()
  (setq evil-escape-key-sequence "jk")
  (setq evil-escape-delay 0.2)
  )

(defun Shawn/post-init-ipython-notebook ()
  (setq output-area-inlined-images t)
  )

;; Add the relevant packages to the layer
(setq python-packages
      '(company
        (company-anaconda :toggle (configuration-layer/package-usedp 'company))))

(defun Shawn/post-init-company ()
  (progn
    (setq company-dabbrev-code-other-buffers 'all)
    ;; enable dabbrev-expand in company completion https://emacs-china.org/t/topic/6381
    (setq company-dabbrev-char-regexp "[\\.0-9a-z-_'/]")


    (setq company-minimum-prefix-length 1
          company-idle-delay 0.08)

    (when (configuration-layer/package-usedp 'company)
      (spacemacs|add-company-backends :modes shell-script-mode makefile-bsdmake-mode sh-mode lua-mode nxml-mode conf-unix-mode json-mode graphviz-dot-mode js2-mode js-mode))

  ))





;;; packages.el ends here
