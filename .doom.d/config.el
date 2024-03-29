;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Patrick Kenzie"
      user-mail-address "patrickkenzie@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

(set-company-backend! :derived 'text-mode nil)
(set-company-backend! :derived 'text-mode 'company-dabbrev)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/all/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; More fine-grained undo
(setq evil-want-fine-undo t)

(remove-hook 'doom-first-buffer-hook #'smartparens-global-mode)

(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-script-padding 0)
)

(add-hook 'web-mode-hook 'my-web-mode-hook)

(after! org (setq org-startup-indented nil))
(setq org-tags-column -80)
(setq org-adapt-indentation nil)
;;(set-company-backend! 'text-mode nil)

(after! org (setq org-capture-templates
                  '(("l" "Log" entry
                     (file+olp+datetree "~/all/org/log.org")
                     "* %<%R: >%? %^g
%t")
                    ("u" "Ultimate" entry
                     (file+headline (lambda () (concat org-directory "ult.org")) "Thoughts")
                     "** %? %^g"
                    )
                    ("y" "Yesterday" entry
                     (file+olp+datetree "~/all/org/log.org")
                     "* %<%R: >%? %^g
%t" :time-prompt t))))
;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-function-name-face ((t (:foreground "gray")))))
