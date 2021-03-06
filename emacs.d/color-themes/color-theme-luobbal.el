;; -*- coding: utf-8 -*-
;;
;; Low constrast colorscheme. Requires color-theme.
;; Expanded version of a scheme generated by
;; http://alexpogosyan.com/color-theme-creator/
;;
;; Copyright (C) 2011 by Johan Benum Evensberget <johanbev@ifi.uio.no>
;;

(defun color-theme-luobbal ()
  (interactive)
  (color-theme-install
    '(color-theme-luobbal-colors
      ((background-color        . "#1c1c1c")
      (background-mode          . light)
      (border-color             . "#1a1a1a")
      (cursor-color             . "#fa0000")
      (foreground-color         . "#999999")
      (mouse-color              . "#ffffff"))
      (fringe                           ((t (:background "#1a1a1a"))))
      (mode-line                        ((t (:foreground "#eeeeec"
                                             :background "#555753"))))
      (region                           ((t (:background "#474747"))))
      (font-lock-builtin-face           ((t (:foreground "#5d8fc0"))))
      (font-lock-comment-face           ((t (:foreground "#ebebeb"))))
      (font-lock-comment-delimiter-face ((t (:foreground "#b4c7cf"))))
      (font-lock-function-name-face     ((t (:foreground "#0183ff"))))
      (font-lock-keyword-face           ((t (:foreground "#4dc4ff"))))
      (font-lock-string-face            ((t (:foreground "#ff930a"))))
      (font-lock-type-face              ((t (:foreground "#7465c8"))))
      (font-lock-variable-name-face     ((t (:foreground "#8e99eb"))))
      (font-lock-constant-face          ((t (:foreground "#a790fc"))))
      (minibuffer-prompt                ((t (:foreground "#65a0c3"
                                             :bold t))))
      (font-lock-warning-face           ((t (:foreground "Red"
                                             :bold t))))
      (font-lock-doc-face               ((t (:foreground "#ffc051"))))
      (escape-glyph                     ((t (:foreground "#ee470d"))))
      (org-level-1                      ((t (:foreground "#0183ff"))))
      (org-level-2                      ((t (:foreground "#9db6cf"))))
      (org-level-3                      ((t (:foreground "#309bef"))))
      (org-level-4                      ((t (:foreground "#788b9e"))))
      (org-level-5                      ((t (:foreground "#61b3ff"))))
      (org-level-6                      ((t (:foreground "#8a999e"))))
      (org-level-7                      ((t (:foreground "#086cc9"))))
      (org-level-8                      ((t (:foreground "#5f6a6e"))))
      (org-formula                      ((t (:foreground "#c2e1ff"))))
      (org-agenda-structure             ((t (:foreground "#c9530a"))))
      (org-todo                         ((t (:foreground "#ffc051"))))
      (org-date                         ((t (:foreground "#baff24"))))
      (org-drawer                       ((t (:foreground "#ff930a"))))
      (org-link                         ((t (:foreground "#a790fc"))))
      (org-footnote                     ((t (:foreground "#a790fc"))))
      (match                            ((t (:foreground "#fee6ff"
                                             :background "#53606e"))))
      (lazy-highlight                   ((t (:foreground "#fee6ff"
                                             :background "#53606e"))))
      (isearch                          ((t (:foreground "#fef6ff"
                                             :background "#739e16"))))
      (isearch-fail                     ((t (:foreground "#fee6ff"
                                             :background "#ff3700"))))
      (show-paren-match                 ((t (:foreground "#fee6ff"
                                             :background "#53606e"))))
      (show-paren-mismatch              ((t (:foreground "#fee6ff"
                                                         :background "#ff3700")))))))

(add-to-list 'color-themes '(color-theme-luobbal "Luobbal" "Johan Benum Evensberget"))

(provide 'color-theme-luobbal)
