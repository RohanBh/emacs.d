;; Add path to the Emacs info files in the INFOPATH environment variable
;;(setenv "INFOPATH"
;;  (concat
;;   "/usr/share/info/emacs-25/" ":"
;;   "/usr/share/info/" ":"
;;   (getenv "INFOPATH")
;;  )
;;)

;; Avoid loading the packages again after processing the init file
(setq package-enable-at-startup nil)

;; Default encoding system set according to https://emacs.stackexchange.com/questions/9488/package-manager-encoding-error
(prefer-coding-system 'utf-8)

;; Add MELPA and MELPA STABLE
(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  (add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  ;; for latest emacs, gnu comes already added to package-archives
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives '("gnu" . (concat proto "://elpa.gnu.org/packages/"))))
  (setq package-archive-priorities
        '(("melpa-stable" . 10)
          ("gnu"     . 5)
          ("melpa"        . 0)))
)
(package-initialize)

;; Disable menu-bar
(menu-bar-mode -1)

;; Disable toolbar
(menu-bar-showhide-tool-bar-menu-customize-disable)

;; Save auto save files and backup files user emacs directory: https://stackoverflow.com/a/22176971/7263373
(setq auto-save-file-name-transforms
      `((".*" ,(concat user-emacs-directory "auto-save/") t)))
(setq backup-directory-alist
      `(("." . ,(expand-file-name
                 (concat user-emacs-directory "backups")))))

;; Enable which-key-mode by default
(which-key-mode 1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#657b83")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-enabled-themes (quote (doom-one)))
 '(custom-safe-themes
   (quote
    ("2af26301bded15f5f9111d3a161b6bfb3f4b93ec34ffa95e42815396da9cb560" default)))
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#fdf6e3" 0.25)
    (quote
     ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#586e75")
 '(highlight-tail-colors
   (quote
    (("#eee8d5" . 0)
     ("#B4C342" . 20)
     ("#69CABF" . 30)
     ("#69B7F0" . 50)
     ("#DEB542" . 60)
     ("#F2804F" . 70)
     ("#F771AC" . 85)
     ("#eee8d5" . 100))))
 '(hl-bg-colors
   (quote
    ("#DEB542" "#F2804F" "#FF6E64" "#F771AC" "#9EA0E5" "#69B7F0" "#69CABF" "#B4C342")))
 '(hl-fg-colors
   (quote
    ("#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3")))
 '(hl-sexp-background-color "#1c1f26")
 '(magit-diff-use-overlays nil)
 '(markdown-asymmetric-header t nil nil "Insert headings with \"#\" in the beginning of the line only")
 '(markdown-code-lang-modes
   (quote
    (("ocaml" . tuareg-mode)
     ("elisp" . emacs-lisp-mode)
     ("ditaa" . artist-mode)
     ("asymptote" . asy-mode)
     ("dot" . fundamental-mode)
     ("sqlite" . sql-mode)
     ("calc" . fundamental-mode)
     ("C" . c-mode)
     ("cpp" . c++-mode)
     ("C++" . c++-mode)
     ("screen" . shell-script-mode)
     ("shell" . sh-mode)
     ("bash" . sh-mode)
     ("Java" . java-mode)
     ("Python" . python-mode))) nil nil "Add modes for Java and Python")
 '(markdown-command
   "pandoc -s --highlight-style tango --strip-comments -f gfm --lua-filter=/home/rohan/.pandoc/task-list.lua --quiet")
 '(markdown-enable-wiki-links t nil nil "Use syntax highlighting for wiki links")
 '(markdown-fontify-code-blocks-natively t nil nil "Enables syntax highlighting for code blocks")
 '(markdown-hide-markup t nil nil "Display text as it would be seen in a browser")
 '(markdown-italic-underscore t nil nil "Use underscores when inserting italicized text coz it looks better")
 '(markdown-open-command "google-chrome-stable" nil nil "Open markdown files directly with chrome (plugin handles the \"md\" format)")
 '(markdown-split-window-direction (quote right) nil nil "Always split windows vertically for live markdown preview")
 '(markdown-wiki-link-fontify-missing t nil nil "Wiki links are shown in different color (red) when links are broken")
 '(nrepl-message-colors
   (quote
    ("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")))
 '(package-selected-packages
   (quote
    (which-key undo-tree typescript-mode doom-themes solarized-theme zenburn-theme material-theme gotham-theme spacemacs-theme elm-mode vmd-mode flymd markdown-mode)))
 '(pdf-view-midnight-colors (quote ("#DCDCCC" . "#383838")))
 '(pos-tip-background-color "#eee8d5")
 '(pos-tip-foreground-color "#586e75")
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#eee8d5" 0.2))
 '(term-default-bg-color "#fdf6e3")
 '(term-default-fg-color "#657b83")
 '(tool-bar-mode nil)
 '(weechat-color-list
   (quote
    (unspecified "#fdf6e3" "#eee8d5" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#657b83" "#839496"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

