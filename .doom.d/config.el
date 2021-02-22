;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Hisbaan Noorani"
      user-mail-address "hisbaan@gmail.com")

;;;;;;;;;;
;; Font ;;
;;;;;;;;;;

(setq doom-font (font-spec :family "MesloLGS Nerd Font Mono" :size 30)
      doom-big-font (font-spec :family "MesloLGS Nerd Font Mono" :size 45)
      doom-vairable-pitch-font (font-spec :family "MesloLGS Nerd Font" :size 30)
      doom-serif-font (font-spec :family "MesloLGS Nerd Font Mono" :size 30 :weight 'light))
;; (set-fontset-font t 'symbol "Noto Color Emoji" nil 'append)
(after! doom-themes
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t))
(custom-set-faces!
  '(font-lock-comment-face :slant italic)
  '(font-lock0keyword-face :slant italic))

(setq-hook! 'LaTeX-mode-hook +spellcheck-immediately nil)

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one-custom)

;;;;;;;;;;
;; Tabs ;;
;;;;;;;;;;

(setq-default tab-width 4)

;; (setq custom-tab-width 4)

;; (defun disable-tabs () (setq indent-tabs-mode nil))
;; (defun enable-tabs  ()
;;   (local-set-key (kbd "TAB") 'tab-to-tab-stop)
;;   (setq indent-tabs-mode t)
;;   (setq tab-width custom-tab-width))

;; (add-hook 'prog-mode-hook 'enable-tabs)
;; (add-hook 'org-mode-hook 'enable-tabs)

;; (setq-default python-indent-offset custom-tab-width)
;; (setq-default evil-shift-width custom-tab-width)

;; (setq backward-delete-char-untabify-method 'hungry)

;;;;;;;;;;;;;;
;; Org Mode ;;
;;;;;;;;;;;;;;

(setq org-directory "~/Documents/org/"
      org-latex-packages-alist '(("margin=1in" "geometry" nil))
      org-hide-emphasis-markers t)

;; Use minted instead of verbatim to allow for syntax hilighting in LaTeX export
(require 'org)
(require 'ox-latex)
(add-to-list 'org-latex-packages-alist '("" "minted"))
(setq org-latex-listings 'minted)

(setq org-latex-pdf-process
      '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))

(setq org-src-fontify-natively t)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((R . t)
   (latex . t)))

;;;;;;;;;;;
;; LaTeX ;;
;;;;;;;;;;;

(setq-hook! 'LaTeX-mode-hook +spellcheck-immediately nil)

(defun compile-latex ()
  (interactive)
  (save-buffer)
  (shell-command (concat "latexmk -lualatex -shell-escape " buffer-file-name)))

(map! :leader
      :desc "Compile with lualatex"
      "c l" (cmds! (eq major-mode 'latex-mode) #'compile-latex
                   #'+default/lsp-command-map))

;; (map! :after latex/tex/auctex
;;       :localleader
;;       :desc "Compile using lualatex"
;;       :map latex-mode-map
;;       "c" #'compile-latex)  ; this will be on `SPC m c` in latex-mode

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

;;;;;;;;;;
;; MU4E ;;
;;;;;;;;;;

;; (use-package mu4e
;;   :ensure nil
;;   ;; :load-path "/usr/share/emacs/site-lisp/mu4e/"
;;   ;; :defer 20 ; Wait until 20 seconds after startup
;;   :config

;;   ;; This is set to 't' to avoid mail syncing issues when using mbsync
;;   (setq mu4e-change-filenames-when-moving t)

;;   ;; Refresh mail using isync every 10 minutes
;;   (setq mu4e-update-interval (* 10 60))
;;   (setq mu4e-get-mail-command "mbsync -c '/home/hisbaan/.config/mu4e/mbsyncrc' -a")
;;   ;; (setq mu4e-maildir "~/Mail/hisbaan-gmail")
;;   (setq mu4e-root-maildir "~/Mail/hisbaan-gmail")
;;   (setq my-mu4e-account-alist "hisbaan-gmail")

;;   (setq mu4e-drafts-folder "/[Gmail]/Drafts")
;;   (setq mu4e-sent-folder   "/[Gmail]/Sent Mail")
;;   (setq mu4e-refile-folder "/[Gmail]/All Mail")
;;   (setq mu4e-trash-folder  "/[Gmail]/Trash")

;;   (setq mu4e-maildir-shortcuts
;;       '(("/Inbox"             . ?i)
;;         ("/[Gmail]/Sent Mail" . ?s)
;;         ("/[Gmail]/Trash"     . ?t)
;;         ("/[Gmail]/Drafts"    . ?d)
;;         ("/[Gmail]/All Mail"  . ?a))))

;;;;;;;;;;;;;;;
;; Yasnippet ;;
;;;;;;;;;;;;;;;

(add-hook 'snippet-hook 'my-snippet-hook)
(defun my-snippet-hook ()
  "Custom behaviours for `snippet'."
  (setq-local require-final-newline nil))

;;;;;;;;;;
;; Misc ;;
;;;;;;;;;;

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

(setq comfirm-kill-emacs nil)

; (bind-key "M-i" #'company-complete)

;;;;;;;;;;;;;;;;;
;; Spell Check ;;
;;;;;;;;;;;;;;;;;

;; if (aspell installed) { use aspell}
;; else if (hunspell installed) { use hunspell }
;; whatever spell checker I use, I always use English dictionary
;; I prefer use aspell because:
;; 1. aspell is older
;; 2. looks Kevin Atkinson still get some road map for aspell:
;; @see http://lists.gnu.org/archive/html/aspell-announce/2011-09/msg00000.html
(defun flyspell-detect-ispell-args (&optional run-together)
  "if RUN-TOGETHER is true, spell check the CamelCase words."
  (let (args)
    (cond
     ((string-match  "aspell$" ispell-program-name)
      ;; Force the English dictionary for aspell
      ;; Support Camel Case spelling check (tested with aspell 0.6)
      (setq args (list "--sug-mode=ultra" "--lang=en_CA"))
      (when run-together
        (cond
         ;; Kevin Atkinson said now aspell supports camel case directly
         ;; https://github.com/redguardtoo/emacs.d/issues/796
         ((string-match-p "--camel-case"
                          (shell-command-to-string (concat ispell-program-name " --help")))
          (setq args (append args '("--camel-case"))))

         ;; old aspell uses "--run-together". Please note we are not dependent on this option
         ;; to check camel case word. wucuo is the final solution. This aspell options is just
         ;; some extra check to speed up the whole process.
         (t
          (setq args (append args '("--run-together" "--run-together-limit=16")))))))
     ((string-match "hunspell$" ispell-program-name)
      ;; Force the English dictionary for hunspell
      (setq args "-d en_CA")))
    args))

(cond
 ((executable-find "aspell")
  ;; you may also need `ispell-extra-args'
  (setq ispell-program-name "aspell"))
 ((executable-find "hunspell")
  (setq ispell-program-name "hunspell")

  ;; Please note that `ispell-local-dictionary` itself will be passed to hunspell cli with "-d"
  ;; it's also used as the key to lookup ispell-local-dictionary-alist
  ;; if we use different dictionary
  (setq ispell-local-dictionary "en_CA")
  (setq ispell-local-dictionary-alist
        '(("en_CA" "[[:alpha:]]" "[^[:alpha:]]" "[']" nil ("-d" "en_CA") nil utf-8))))
 (t (setq ispell-program-name nil)))

;; ispell-cmd-args is useless, it's the list of *extra* arguments we will append to the ispell process when "ispell-word" is called.
;; ispell-extra-args is the command arguments which will *always* be used when start ispell process
;; Please note when you use hunspell, ispell-extra-args will NOT be used.
;; Hack ispell-local-dictionary-alist instead.
(setq-default ispell-extra-args (flyspell-detect-ispell-args t))
;; (setq ispell-cmd-args (flyspell-detect-ispell-args))
(defadvice ispell-word (around my-ispell-word activate)
  (let ((old-ispell-extra-args ispell-extra-args))
    (ispell-kill-ispell t)
    (setq ispell-extra-args (flyspell-detect-ispell-args))
    ad-do-it
    (setq ispell-extra-args old-ispell-extra-args)
    (ispell-kill-ispell t)))

(defadvice flyspell-auto-correct-word (around my-flyspell-auto-correct-word activate)
  (let ((old-ispell-extra-args ispell-extra-args))
    (ispell-kill-ispell t)
    ;; use emacs original arguments
    (setq ispell-extra-args (flyspell-detect-ispell-args))
    ad-do-it
    ;; restore our own ispell arguments
    (setq ispell-extra-args old-ispell-extra-args)
    (ispell-kill-ispell t)))

(defun text-mode-hook-setup ()
  ;; Turn off RUN-TOGETHER option when spell check text-mode
  (setq-local ispell-extra-args (flyspell-detect-ispell-args)))
(add-hook 'text-mode-hook 'text-mode-hook-setup)
