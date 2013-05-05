;;; info

; C-u 0 M-x byte-recompile-directory
; will compile all the .el files in the directory and in all subdirectories below.
; The C-u 0 part is to make it not ask about every .el file that does
; not have a .elc counterpart.

; And thereafter (once each has been compiled once), just use the same
; command without the C-u 0 (aka C-0, BTW). That will byte-compile
; only those source files that are more recent than their
; byte-compiled versions.

;;; packaging
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

; There is a small bug in Emacs24’s package.el such that the
; dependency order comes out backwards. The problem is patched by some
; advice.

(defadvice package-compute-transaction
  (before package-compute-transaction-reverse (package-list requirements) activate compile)
    "reverse the requirements"
    (setq requirements (reverse requirements))
    (print requirements))

;(when (not package-archive-contents)
;  (package-refresh-contents))

;; Add in your own as you wish:
;(defvar my-packages '(starter-kit
;                      ;starter-kit-lisp
;                      ;starter-kit-bindings
;                      ;starter-kit-ruby
;                      ;starter-kit-js
;                      ;starter-kit-eshell
;                      ace-jump-mode
;                      auto-complete
;                      clojure-mode
;                      evil
;                      exec-path-from-shell
;                      yasnippet
;                      birds-of-paradise-plus-theme
;                      color-theme-sanityinc-tomorrow
;                      cyberpunk-theme
;                      django-theme
;                      gruber-darker-theme
;                      inkpot-theme
;                      pastels-on-dark-theme
;                      phoenix-dark-mono-theme
;                      phoenix-dark-pink-theme
;                      soothe-theme
;                      subatomic-theme
;                      tango-2-theme
;                      twilight-anti-bright-theme
;                      twilight-theme
;                      underwater-theme)
;  "A list of packages to ensure are installed at launch.")

;(dolist (p my-packages)
; (when (not (package-installed-p p))
;  (package-install p)))

;;; general settings
(setq ring-bell-function 'ignore)
(setq-default truncate-lines 0)
(global-linum-mode 1)
(setq create-lockfiles nil)
(setq mouse-wheel-scroll-amount '(0.01))
(windmove-default-keybindings 'meta)

(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'super)
; Use fn key as hyper. http://irreal.org/blog/?p=1450
(setq ns-function-modifier 'hyper)

(setq whitespace-style '(face tabs spaces trailing lines-tail newline indentation empty space-before-tab space-after-tab space-mark tab-mark newline-mark))

; Copy env variables from shell on OSX
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(defadvice load-theme 
  (before theme-dont-propagate activate)
  (mapcar #'disable-theme custom-enabled-themes))
(load-theme 'sanityinc-tomorrow-bright t)

;;; ibuffer
(global-set-key (kbd "C-x C-b") 'ibuffer)
(setq ibuffer-expert t)
(add-hook 'ibuffer-mode-hook
	  '(lambda ()
	     (ibuffer-auto-mode 1)))

;;; ido
;(setq ido-decorations (quote ("\n-> " "" "\n   " "\n   ..." "[" "]" " [No match]" " [Matched]" " [Not readable]" " [Too big]" " [Confirm]")))
;(defun ido-disable-line-trucation () (set (make-local-variable 'truncate-lines) nil))
;(add-hook 'ido-minibuffer-setup-hook 'ido-disable-line-trucation)

;;; emacs-starter-kit overrides
(remove-hook 'prog-mode-hook 'esk-turn-on-hl-line-mode)

;;; evil mode
(evil-mode 1)

; esc quits
(defun minibuffer-keyboard-quit ()
  "Abort recursive edit.
In Delete Selection mode, if the mark is active, just deactivate it;
then it takes a second \\[keyboard-quit] to abort the minibuffer."
  (interactive)
  (if (and delete-selection-mode transient-mark-mode mark-active)
      (setq deactivate-mark  t)
    (when (get-buffer "*Completions*") (delete-windows-on "*Completions*"))
    (abort-recursive-edit)))
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)

;;; autocomplete
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-20130330.1836/dict")
(ac-config-default)



;; legacy color themes (< 24)
;(require 'color-theme)
;(add-to-list 'load-path (concat user-emacs-directory "/color-themes"))
;(require 'color-theme-tango)
;(color-theme-tango)
