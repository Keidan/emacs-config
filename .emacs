
(setq additional-paths '("~" "~/.emacs.d/lisp/"))
(setq load-path (append additional-paths load-path))

(load "~/.emacs.d/lisp/lush-theme.el")
(load "~/.emacs.d/lisp/markdown-mode.el")
;(load "~/.emacs.d/lisp/font-lock.el")
;(load "~/.emacs.d/lisp/fontl-hooks.el")
(load "~/.emacs.d/lisp/sr-speedbar.el")
(load "~/.emacs.d/lisp/tabbar.el")


;;;;;;;;;;;;;;;;;
;; APPEARANCE
;;;;;;;;;;;;;;;;;
; set c-mode for all .go and .cmd type files and awk
(setq auto-mode-alist (cons '("\\.text$" . text-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.txt$" . text-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.doc$" . text-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.awk$" . awk-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.perl$" . perl-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.pl$" . perl-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.C$" . c++-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.cpp$" . c++-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.cxx$" . c++-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.tcl$" . tcl-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.java$" . java-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.md$" . markdown-mode) auto-mode-alist))

;; ========================================================
;; SYSTEME
;; ========================================================

;; Environnement
(set-language-environment "UTF-8")

;; Inhiber l'affichage du message d'accueil
(setq inhibit-startup-message t)

;; Afficher l'heure et la date
(setq display-time-day-and-date t)
(setq display-time-24hr-format t)
(display-time-mode t)

;; Désactiver le son
(setq ring-bell-function 'ignore)



;;========================================================
;; AFFICHAGE
;;========================================================

;; Afficher les barres de menu
(menu-bar-mode t)
(tool-bar-mode t)
(scroll-bar-mode t)
(column-number-mode t)

;; Positionner la scrollbar à droite
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(display-time-mode t)
 '(ecb-compile-window-width (quote edit-window))
 '(ecb-layout-name "left15")
 '(ecb-options-version "2.40")
 '(ecb-primary-secondary-mouse-buttons (quote mouse-1--mouse-2))
 '(ecb-tip-of-the-day nil)
 '(ecb-tree-buffer-style (quote image))
 '(scroll-bar-mode (quote right))
 '(tool-bar-mode nil))

;; Cas où les lignes sont trop lignes
(setq truncate-lines nil)
(setq truncate-partial-width-windows nil)



;;=========================================================
;; COULEURS
;;=========================================================

; https://github.com/andre-richter/emacs-lush-theme
(load-theme 'lush t)

;;=========================================================
;; PREFERENCES
;;=========================================================

;; Lorsqu'on saisit un texte alors qu'une zone est sélectionnée, cette dernière est écrasée par le texte saisi.
(delete-selection-mode t)

;; Utiliser des espaces pour indenter
(setq indent-tabs-mode nil)

;; Complétion automatique qui ignore la casse
(global-set-key "\C-t" "\M-/")
(setq completion-ignore-case t) 

;; Remplacer "yes" et "no" par "y" et "n"
(fset 'yes-or-no-p 'y-or-n-p)

;; Activer la mise en exergue des espaces superflus ou hétérogènes
(require 'whitespace)

;; Supprimer tous les espaces en fin de ligne
(autoload 'nuke-trailing-whitespace "whitespace" nil t)

;; Mettre un titre aux fenêtres
(setq frame-title-format '(buffer-file-name "%b"))



;;========================================================
;; RACCOURCIS CLAVIER
;;========================================================

;; Commenter ou non le texte selectionné
(global-set-key (kbd "C-c c") 'comment-dwim)

;; Remplacer chaine de caractères
(global-set-key (kbd "C-c f") 'query-replace)

;; Ouverture d'un term dans emacs
(global-set-key (kbd "M-t") 'term)

;; Window navigation
(global-set-key [f1] 'delete-other-windows)
(global-set-key [f2] 'split-window-vertically)
(global-set-key [f3] 'split-window-horizontally)

;;(when (fboundp 'windmove-default-keybindings)
;;  (windmove-default-keybindings))
;;(global-set-key (kbd "C-x <left>")  'windmove-left)
;;(global-set-key (kbd "C-x <right>") 'windmove-right)
;;(global-set-key (kbd "C-x <up>")    'windmove-up)
;;(global-set-key (kbd "C-x <down>")  'windmove-down)
;;(global-set-key (kbd "C-c <right>") 'hs-show-block)
;;(global-set-key (kbd "C-c <left>")  'hs-hide-block)
;;(global-set-key (kbd "C-c <up>")    'hs-hide-all)
;;(global-set-key (kbd "C-c <down>")  'hs-show-all)

;; Rappel des fondamentaux:
;; "M-w" : copier
;; "C-y" : coller
;; "C-w" : couper
;; "C-x C-s" : sauvegarder



;; ========================================================
;; Mode d'édition préféré par type de fichier
;; ========================================================

;; Sélection du mode d'édition en fonction du nom de fichier.
(setq auto-mode-alist
  (append
    '(("\\.k?sh\\'" . sh-mode)
      ("bash" . sh-mode)
      ("profile" . sh-mode)
      ("[Mm]akefile\\'" . makefile-mode)
      ("\\.mk\\'" . makefile-mode)
      ("\\.[ch]\\'" . c-mode)
      ("\\.[ch]pp\\'" . c++-mode)
      ("\\.x[ms]l\\'" . nxml-mode)
      ("\\.[sx]?html?\\'" . nxml-mode)
      ("\\.php\\'" . php-mode)
      ("\\.java\\'" . java-mode)
      ("\\.sql\\'" . sql-mode)
      ("\\.tcl\\'" . tcl-mode)
      ("\\.vhd\\'" . vhdl-mode)
      ("\\.md\\'" . markdown-mode)
     )
     auto-mode-alist
  )
)




;;========================================================
;; C/C++
;;========================================================

;; Charger le mode C/C++
(require 'cc-mode)

;; Définition d'un style
(defconst my-c-style
  '(;; Indentation via la touche TAB
    (c-tab-always-indent . t)
    ;; Formatage à 78 colonnes
    (fill-column . 78)    
    ;; Le style d'indentation
    (setq c-default-style "k&r")   
    ;; L'indentation se fait avec un pas de 2 caractères
    (c-basic-offset . 2)
    ;; Aligner les commentaires avec le code
    (c-comment-only-line-offset . 0)
    ;; Les commentaires multi-ligne commencent par une simple ligne '/*'
    (c-hanging-comment-starter-p . t)
    ;; et se terminent par une simple ligne '*/'
    (c-hanging-comment-ender-p . t)
    ;; Cas où une accolade est « électrique » (i.e. provoque une mise
    ;; en page automatique)
    (c-hanging-braces-alist .
      ((substatement-open after)
       (brace-list-open)
       (brace-entry-open)
       (block-close . c-snug-do-while)
       (extern-lang-open after)
       (inexpr-class-open after)
       (inexpr-class-close before)))
    ;; Cas où le caractère « : » est « électrique » (i.e. provoque une
    ;; mise en page automatique)
    (c-hanging-colons-alist .
      ((member-init-intro before)
       (inher-intro)
       (case-label after)
       (label after)
       (access-label after)))
    ;; Nettoyage automatique de certaines mises en page
    (c-cleanup-list .
      (scope-operator
       empty-defun-braces
       defun-close-semi))
    (c-offsets-alist .
      (;; Première ligne d'une construction de premier niveau (par
       ;; exemple une déclaration de fonction)
       (topmost-intro . 0)
       ;; Lignes suivantes d'une construction de premier niveau
       (topmost-intro-cont . 0)
       ;; Première ligne d'une liste d'argument
       (arglist-intro . +)
       ;; Argument lorsque la ligne ouvrant la liste ne contient pas
       ;; d'argument.
       (arglist-cont . 0)
       ;; Argument lorsque la ligne ouvrant la liste en contient au moins un.
       (arglist-cont-nonempty . c-lineup-arglist)
       ;; Parenthèse fermant une liste d'arguments mais non précédée d'un
       ;; argument sur la même ligne.
       (arglist-close . c-lineup-close-paren)
       ;; Première ligne d'une instruction quelconque
       (statement . 0)
       ;; Lignes suivantes de l'instruction quelconque
       (statement-cont . +)
       ;; Première ligne d'un bloc
       (statement-block-intro . +)
       ;; Première ligne d'un bloc case
       (statement-case-intro . +)
       ;; Première ligne d'un bloc case commençant par une accolade
       (statement-case-open . 0)
       ;; Instruction suivant une instruction de test ou de contrôle de boucle
       (substatement . +)
       ;; Accolade suivant une instruction de test ou de contrôle de boucle
       (substatement-open . 0)
       ;; Accolade ouvrante d'une énumération ou d'un tableau statique
       (brace-list-open . 0)
       ;; Accolade fermante d'une énumération ou d'un tableau statique
       (brace-list-close . 0)
       ;; Première ligne d'une énumération ou d'un tableau statique
       (brace-list-intro . +)
       ;; Lignes suivantes d'une énumération ou d'un tableau statique
       (brace-list-entry . 0)
       ;; Lignes suivantes d'une énumération ou d'un tableau statique
       ;; commençant par une accolade ouvrante
       (brace-entry-open . 0)
       ;; Label d'un switch
       (case-label . +)
       ;; Label d'une classe (public, protected, private) en retrait d'un pas
       ;; par rapport à l'indentation normale au sein d'une classe (cf.
       ;; déclaration « inclass » plus bas).
       (access-label . -)
       ;; Autres labels
       (label . 0)
       ;; Ouverture de bloc
       (block-open . 0)
       ;; Fermeture de bloc
       (block-close . 0)
       ;; A l'intérieur d'une chaîne multi-ligne
       (string . c-lineup-dont-change)
       ;; Première ligne d'un commentaire
       (comment-intro . c-lineup-comment)
       ;; A l'intérieur d'un commentaire C multi-ligne
       (c . c-lineup-C-comments)
       ;; Accolade ouvrant une fonction
       (defun-open . 0)
       ;; Accolade fermant une fonction
       (defun-close . 0)
       ;; Code suivant l'accolade ouvrante d'une fonction
       (defun-block-intro . +)
       ;; Clause else d'une expression conditionnelle
       (else-clause . 0)
       ;; Clause catch d'une instruction try
       (catch-clause . 0)
       ;; Accolade ouvrant une déclaration de classe
       (class-open . 0)
       ;; Accolade fermant la déclaration de classe
       (class-close . 0)
       ;; Accolade ouvrante d'une méthode définie dans la classe elle-même
       ;; (inline)
       (inline-open . 0)
       ;; Accolade fermante de la méthode inline
       (inline-close . 0)
       ;; Alignement des opérateurs de flux (<< et >>) sur les opérateurs de
       ;; flux de la ligne précédente
       (stream-op . c-lineup-streamop)
       ;; Ligne incluse dans une déclaration de classe (double indentation car
       ;; les labels d'accès public, protected et private sont déjà indentés)
       (inclass . ++)
       ;; Accolade ouvrant un bloc en langage externe (extern "C" {})
       (extern-lang-open . 0)
       ;; Accolade fermant un bloc en langage externe
       (extern-lang-close . 0)
       ;; Indentation dans un bloc de langage externe
       (inextern-lang . +)
       ;; Accolade ouvrant un bloc d'espace de nom
       (namespace-open . 0)
       ;; Accolade fermant un bloc d'espace de nom
       (namespace-close . 0)
       ;; Indentation dans un bloc d'espace de nom
       (innamespace . +)
       ;; Première ligne d'héritage
       (inher-intro . +)
       ;; Lignes suivantes d'héritage
       (inher-cont . c-lineup-multi-inher)
       ;; Première ligne de la liste d'initialisation
       (member-init-intro . +)
       ;; Lignes suivantes de la liste d'initialisation
       (member-init-cont . c-lineup-multi-inher)
       ;; Lignes entre la déclaration de fonction et l'accolade ouvrante. En
       ;; C, il n'y a rien mais en C++, il y a les listes d'initialisation
       (func-decl-cont . +)
       ;; Première ligne d'une macro (avec un décalage négatif excessif afin
       ;; d'être certain qu'elle reste collée à gauche en toute circonstance
       (cpp-macro . -1000)
       ;; Lignes suivantes d'une macro
       (cpp-macro-cont . c-lineup-dont-change)
       ;; Fonction amie
       (friend . 0)
       ;; while qui termine une instruction do { ... } while (...);
       (do-while-closure . 0)
       ;; Bloc d'instruction à l'intérieur d'une expression
       (inexpr-statement . 0)
       ;; Définition de classe à l'intérieur d'une expression (cela n'a de
       ;; sens qu'en Java mais autant définir ce contexte au cas où...)
       (inexpr-class . +)
       ;; Lignes autres que la première d'un modèle de fonction ou de classe
       (template-args-cont . +)
       ;; Arguments d'une fonction à la sauce K&R
       (knr-argdecl-intro . +)
       (knr-argdecl . 0)))
    (c-echo-syntactic-information-p . t)
  )
  "My C Programming Style"
)

;; Faire du style défini ci-dessus le style C/C++ par défaut
(defun my-c-mode-common-hook ()
  (c-add-style "PERSONAL" my-c-style t)
)
(add-hook 'c-mode-hook 'my-c-mode-common-hook)
(add-hook 'c++-mode-hook 'my-c-mode-common-hook)

; Activation systématique du mode mineur HS dans les modes C/C++
(add-hook 'c-mode-common-hook 'hs-minor-mode t)

;-------------
; Speedbar
;-------------
;(speedbar 1)
(add-hook 'emacs-startup-hook (lambda ()
  (sr-speedbar-open)
))
(setq speedbar-show-unknown-files t) ; show all files
(setq speedbar-use-images nil) ; use text forbuttons (instead of the images)
(setq sr-speedbar-right-side nil) ; put on left side
(setq sr-speedbar-width 30)

;; ---------------------------------------
;; load tabbar
;; ---------------------------------------
(require 'tabbar)
(tabbar-mode 1)
(tabbar-local-mode 1)
;; Sort tabbar buffers by name
(defun tabbar-add-tab (tabset object &optional append_ignored)
  "Add to TABSET a tab with value OBJECT if there isn't one there yet.
 If the tab is added, it is added at the beginning of the tab list,
 unless the optional argument APPEND is non-nil, in which case it is
 added at the end."
  (let ((tabs (tabbar-tabs tabset)))
    (if (tabbar-get-tab object tabset)
        tabs
      (let ((tab (tabbar-make-tab object tabset)))
        (tabbar-set-template tabset nil)
        (set tabset (sort (cons tab tabs)
                          (lambda (a b) (string< (buffer-name (car a)) (buffer-name (car b))))))))))
;; Tab navigation made easy
(global-set-key [M-left] 'tabbar-backward-tab)
(global-set-key [M-right] 'tabbar-forward-tab)
;; Windows-style behaviour and key bindings
(dolist (func '(tabbar-mode tabbar-forward-tab tabbar-forward-group tabbar-backward-tab tabbar-backward-group))
      (autoload func "tabbar" "Tabs at the top of buffers and easy control-tab navigation"))
(defmacro defun-prefix-alt (name on-no-prefix on-prefix &optional do-always)
      `(defun ,name (arg)
         (interactive "P")
         ,do-always
         (if (equal nil arg)
             ,on-no-prefix
           ,on-prefix)))
(defun-prefix-alt shk-tabbar-next (tabbar-forward-tab) (tabbar-forward-group) (tabbar-mode 1))
(defun-prefix-alt shk-tabbar-prev (tabbar-backward-tab) (tabbar-backward-group) (tabbar-mode 1))
(global-set-key [(control tab)] 'shk-tabbar-next)
(global-set-key [(control shift tab)] 'shk-tabbar-prev)
;; Add a buffer modification state indicator in the tab label, and place a
;; space around the label to make it looks less crowd.
(defadvice tabbar-buffer-tab-label (after fixup_tab_label_space_and_flag activate)
   (setq ad-return-value
         (if (and (buffer-modified-p (tabbar-tab-value tab))
                  (buffer-file-name (tabbar-tab-value tab)))
             (concat " + " (concat ad-return-value " "))
           (concat " " (concat ad-return-value " ")))))
;; Called each time the modification state of the buffer changed.
(defun ztl-modification-state-change ()
   (tabbar-set-template tabbar-current-tabset nil)
   (tabbar-display-update))
;; First-change-hook is called BEFORE the change is made.
(defun ztl-on-buffer-modification ()
   (set-buffer-modified-p t)
   (ztl-modification-state-change))
 (add-hook 'after-save-hook 'ztl-modification-state-change)
;; This doesn't work for revert, I don't know.
;;(add-hook 'after-revert-hook 'ztl-modification-state-change)
(add-hook 'first-change-hook 'ztl-on-buffer-modification)


;--------
; auto complete
;--------
(add-to-list 'load-path "~/.emacs.d/lisp/auto-complete/")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/lisp/auto-complete/ac-dict")
(ac-config-default)

;--------
; update font
;--------
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(set-face-attribute 'default (selected-frame) :height 100)

