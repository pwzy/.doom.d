;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "John Doe"
      user-mail-address "john@doe.com")

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

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
;; (setq org-directory "~/org/")
(setq org-directory "~/Library/Mobile Documents/com~apple~CloudDocs/Documents/org/")
;; (setq org-image-actual-width (/ (display-pixel-width) 3))
(setq org-image-actual-width 900)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


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


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ui
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; 设置全屏
(add-to-list 'default-frame-alist '(fullscreen . maximized))
;; 设置字体
;; Add to ~/.doom.d/config.el
(setq doom-font (font-spec :family "FiraMono Nerd Font" :size 15 :weight 'semi-light)
      doom-variable-pitch-font (font-spec :family "FiraMono Nerd Font") ; inherits `doom-font''s :size
      doom-unicode-font (font-spec :family "FiraMono Nerd Font" :size 15)
      )
;; 设置logo
(setq fancy-splash-image "~/.doom.d/img/logo.png")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; org
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 设置org-agenda搜索的文件
(setq org-agenda-files (list "~/Library/Mobile Documents/com~apple~CloudDocs/Documents/org/gtd.org"
                             "~/Library/Mobile Documents/com~apple~CloudDocs/Documents/org/todo.org"
                             "~/Library/Mobile Documents/com~apple~CloudDocs/Documents/org/tip.org"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; key-bind
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 设置evil-mode跳转屏幕行
(define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)
(define-key evil-normal-state-map (kbd "<down>") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "<up>") 'evil-previous-visual-line)

(define-key evil-visual-state-map (kbd "j") 'evil-next-visual-line)
(define-key evil-visual-state-map (kbd "k") 'evil-previous-visual-line)
(define-key evil-visual-state-map (kbd "<down>") 'evil-next-visual-line)
(define-key evil-visual-state-map (kbd "<up>") 'evil-previous-visual-line)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; translate
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 设置翻译插件
(use-package! go-translate
  :config
  (setq go-translate-base-url "https://translate.google.cn"
        go-translate-local-language "zh-CN"
        go-translate-token-current (cons 430675 2721866130))
  (map! :leader
        ;; 可以直接用以下形式 
        ;; :desc "Translate"                 "t t" #'go-translate
        ;; 也可以使用以下形式进行前缀提示
        (:prefix-map ("t" . "toggle")
         :desc "Translate"                 "t" #'go-translate
         :desc "Translate in Popup"        "T" #'go-translate-popup)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; company
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 设置company
(setq company-idle-delay 0)
(setq company-minimum-prefix-length 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; lsp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 注意python环境变量的位置，python的环境变量要在brew之前，避免python3定位到brew环境中
(setq +lsp-company-backends 'company-capf)
;; 设置python-mode中远程python解释器
;; (setq python-shell-remote-exec-path '("/home/jing/anaconda3/envs/torch_1_8/bin"))
(setq python-shell-remote-exec-path '("~/anaconda3/envs/torch_1_8/bin"))
;; 设置lsp-mode中的远程lsp server
(use-package! lsp-mode
  :config
  ;; 进行远程语言服务器的连接，注意本地不能有和远程同名的项目
  (lsp-register-client
    (make-lsp-client :new-connection (lsp-tramp-connection "~/anaconda3/envs/torch_1_8/bin/jedi-language-server")
                     :major-modes '(python-mode)
                     :remote? t
                     :server-id 'jedi-language-server)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; latex
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq +latex-viewers '(pdf-tools))
