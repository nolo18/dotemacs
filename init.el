;;; init.el --- Fichero inicial de configuracion     -*- lexical-binding: t; -*-

;; Copyright (C) 2021  M. Márquez

;; Author: M. Márquez <nolo18@khelnet.xyz>
;; Keywords: local, lisp

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; En este fichero comienza realmente la configuración.

;;; Code:


;; TODO: Aún no tengo decidido como voy a llevar a cabo mi configuración.
;; No se si lo voy a hacer en fichero monolítico con org-mode o
;; dividiendo la configuración en múltiples ficheros. Por ahora toda
;; la configuración irá en este fichero.

;; Información básica de contacto para las plantillas y demás.
(setq user-full-name "M. Márquez")
(setq user-mail-address "nolo18@khelnet.xyz")


;; BETTER DEFAULTS

(setq
 ;; Omitir la pantalla de vienvenida
 inhibit-startup-screen t
 ;; No necesito que me recuerden para que sirve el *scratch* buffer
 initial-scratch-message nil
 ;; Dos espacios despues del punto y final de una frase es una falta
 ;; de ortografía.
 sentence-end-double-space nil
 ;; No necesito avisos visuales o sonoros de ningún tipo.
 ring-bell-function 'ignore
 ;; cualquier interacción debe realizarse en el minibuffer, aunque
 ;; proceda de una acción del ratón.
 ;; TODO: No estoy muy seguro de esto, porque para flyspell, hacerlo
 ;; en el minibuffer no parece muy bueno. Habrá que ponerlo en
 ;; pruebas.
 use-dialog-box nil
 ;; Cuando deselecciono algo quiero desactivar la marca.
 mark-even-if-inactive nil
 ;; TODO: No se si quiero que C-k borre la linea completa aunque, no
 ;; cómo funciona exactamente. Tengo que investigar esto.
 ;; kill-whole-line t
 ;; Las búsquedas deben diferenciar mayúsculas y minúsculas por defecto.
 case-fold-search nil
 )

;; TODO: Aún no tengo claro cómo trabajar el tema de los tabuladores.
;; (setq-default indent-tabs-mode nil)


;; Mucho más cómodo
(defalias 'yes-or-no-p 'y-or-n-p)

;; Es bueno que Emacs soporte gran variedad de codificaciones de
;; caracteres, pero UTF-8 debe ser siempre, siempre el preferido.
(set-charset-priority 'unicode)
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(setq default-process-coding-system '(utf-8-unix . utf-8-unix))

;; ALGUNOS "MINOR-MODES" INTERESANTES.

;; Cuando cuando escribo y hay algo seleccionado, quiero que el texto
;; seleccionado sea reemplazado con el que estoy escribiendo.
(delete-selection-mode 1)

;; Quiero ver la columna reflejada en la "modeline"
(column-number-mode 1)

;; TODO: Tengo que decidir si quiero el resaltado de la línea actual
;; de texto que estoy editando... Esto dependerá del tema que use
;; al final de la configuración... Pero en principio sería interesante
;; tenerlo solo activado en los modos de programación. Lo mismo más
;; adelante añado esta funcionalidad a otros modos.

;; hl-line-mode seguro que es una función "autoload", así que para
;; aplicar esta configuración hay que requerir la carga del módulo
;; antes.
(require 'hl-line)
(add-hook 'prog-mode-hook #'hl-line-mode)

;; Emacs tiende a llenar mi sistema de archivos con copias de seguridad,
;; archivos temporales de autosalvado y similares, ya que trabaja bajo
;; la premisa de que varios usuarios pueden estar modificando el mismo
;; fichero a la vez. No es mi caso, así que es mejor desactivar todas
;; esas copias de respaldo... Correré el riesgo!!!!

(setq
 make-backup-files nil
 auto-save-default nil
 create-lockfiles nil)

;; Por defecto, cualquier configuración que se haga a través de su
;; sistema de configuración visual or utilizando la función
;; "custom-set-variable" se agregará al fichero de configuración
;; inicial, o al fichero especificado en la variable "custom-file".
;; De igual modo, Emacs guarda información acerca de la seguridad
;; al cargar algunos temas de color.
;; En cualquier caso, yo quiero mi archivo de configuración limpio
;; de intrusiones de cualquier tipo, así que prefiero especificar
;; un fichero oculto en mi directorio de configuración para estos
;; menesteres.
;; TODO: De igual modo, quiero mi directorio de configuración limpio
;; de intrusiones, por lo que seguramente, tendré que mover muchos
;; archivos e historias de configuración a un directorio en
;; "$HOME/.local/share/emacs" o similar.

(setq custom-file (expand-file-name ".custom.el" user-emacs-directory))

;; TODO: No estoy seguro si voy a utilizar el módulo "recentf" por ahora.
;; pero en (https://blog.sumtypeofway.com/posts/emacs-config.html) indican
;; como evitar que aparezcan asuntos relacionados con "elpa" en los
;; archivos recientes.
;; (require 'recentf)
;; (add-to-list 'recentf-exclude "\\elpa")


;; EMOJI
;; Seguramente quiera usar emojis y deberé seleccionar alguna fuente
;; para ello. Las fuentes que habitualmente uso "Nerd Fonts" vienen
;; parcheadas para eso. Aunque lo mismo tengo que utilizar alguna otra
;; fuente para eso "icon-fonts" o similar, ya veré. Pero la manera
;; de utilizarla sería algo como esto.
;; TODO: Tengo que estudiar esto más detenidamente.
;; (if ( version< "27.0" emacs-version )
;;     (set-fontset-font "fontset-default" 'unicode "Apple Color Emoji" nil 'prepend)
;;   (warn "This Emacs version is too old to properly support emoji."))

;; Hay un montón de atajos de teclado que, en mi humilde opinión, son
;; del todo inútiles, y que pueden ser pulsados de modo accidental. Es
;; mejor deshabilitarlos.
;; TODO: Quizá deba utilizar "kbd" macro
;; ;; (global-unset-key "\C-x\C-r")			;find-file-read-only
;; (global-unset-key "\C-x\C-d")			;list-directory
;; (global-unset-key "\C-z")			;suspend-frame
;; (global-unset-key "<mouse-2>")		;pegar con click en la rueda del ratón.
;; (global-unset-key "M-o")			;facemenu-mode ¿?
;; (global-unset-key "<\C-wheel-down>")		;Ajustar tamaño letra con la rueda
					;del ratón...

;; El tratamiento de los espacios en blanco innecesarios está más que
;; claro. Eliminarlos sin piedad!!!... Además de añadir una línea en
;; blanco al final de los archivos, que siempre queda bien.

(add-hook 'before-save-hook #'delete-trailing-whitespace)
(setq require-final-newline t)

;; TODO: No tengo claro si voy a definir mis propias variables locales
;; con "defvar" en mi configuración, pero si me dan algún problema de
;; avisos de seguridad aquí está la configuración que debo usar.
;; (setq enable-local-variables :all)


;; ASPECTO VISUAL

;; Seleccionar la fuente por defecto.
;; ---
;; Creo que lo mejor es hacerlo con un "cond" y comprobar por orden
;; de preferencia las fuentes instaladas en el ordenador para utilizar
;; la adecuada y si no la que instala por defecto Emacs en caso de
;; no encontrar ninguna de las anteriores.

;; Tema de color
;; ---
;; Al final, seguramente me decantaré por "modus-themes". Son buenos
;; y cómodos temas de escritorio, Además de tener la opción de cambiar
;; de claro a oscuro facilmente. y Son altamente configurables.

;; Resaltar las parejas de paréntesis, llaves y demás.
;; TODO: Lo mismo instalo "smart-parens" y mato unos cuantos pájaros
;; de un tiro.
;; - Se autoinserta el cierre corespondiente.
;; - Se resalta el par asociado
;; - Y obtengo la funcionalidad de "paredir" con "smart-parens-strict-
;; mode"
(show-paren-mode 1)

;; TODO: Para editar texto plano, puede ser muy interesante la función
;; "fill-paragraph" (M-q). Justifica el texto atendiendo al valor de
;; la variable "fill-column". Sería muy conveniente, fijar de modod local
;; esta bariable para los ficheros de texto plano y poder utilizar esta
;; función cuando se quiera.

;; TODO: Seleccionar un buen atajo de teclado para abrir el archivo
;; de configuración. La función en concreto sería algo así:
;; (defun open-init-file ()
;;   "Open this very file."
;;   (interactive)
;;   (find-file "~/.config/emacs/readme.org"))
;;
;; (bind-key "C-c e" #'open-init-file)


;; TODO: global-so-long-mode -> Echar un vistazo cuando tenga tiempo
;; aunque no creo que lo necesite.

;; TODO: Algunas funciones interesante que pueden facilitar mucho
;; la vida.
;; kill-this-buffer sin más preguntas
;; (defun kill-this-buffer ()
;;   "Kill the current buffer."
;;   (interactive)
;;   (kill-buffer nil)
;;   )
;; (bind-key "C-x k" #'kill-this-buffer)
;; (bind-key "C-x K" #'kill-buffer)

;; kill-all-buffers Tamibién muy interesante.
;; (defun kill-all-buffers ()
;;   "Close all buffers."
;;   (interactive)
;;   ;; (maybe-unset-buffer-modified)
;;   (save-some-buffers)
;;   (let ((kill-buffer-query-functions '()))
;;     (mapc 'kill-buffer (buffer-list))))


;; TODO: minibuffer -> Hay mucho que mirar en ese respecto. Algunas
;; variables que fijan muchos son.
;; (setq enable-recursive-minibuffers t)
;; (minibuffer-depth-indicate-mode)

;; TODO: Esto también parece interesante. Una función con una
;; combinación de teclas para cambiar a buffer *scratch* facilmente.
;; (defun switch-to-scratch-buffer ()
;;   "Switch to the current session's scratch buffer."
;;   (interactive)
;;   (switch-to-buffer "*scratch*"))
;;
;; (bind-key "C-c a s" #'switch-to-scratch-buffer)


;; ORG-MODE
;; ----------------------------------
;; He visto por aquí algunas variables que no conocía.
(setq org-return-follows-link t
      org-src-ask-before-returning-to-edit-buffer nil
      ;; org-src-window-setup (mirar tranquilamente)
      ;; org-footnote-section (mirar tranquilamente y probar)
)




;; TODO: Echar un vistazo a paquetes que son recomendados por muchos.
;; -----------------------------------------------------------------
;;
;;   - [ ] undo-tree
;;   - [ ] all-the-icons; all-the-icons-dired
;;   - [ ] diminish (seguramente si) No quiero el "modeline" lleno de
;;   información innecesaria.
;;   - [ ] doom-themes; doom-modeline -> Quiero algo más limpio. Para
;;   eso instalo doom directamente.
;;   - [ ] tree-sitter Parece ser que hace bastante bien su trabajo
;;   en cuanto al resaltado de sintaxis.
;;   - [ ] centaru-tabs -> No creo que quiera pestañas pero echaré
;;   un vistazo.
;;   - [ ] sudo-edit -> Esto si es interesante si quiero editar ficheros
;;   de configuración sin tener que hacerlo en consola.
;;   - [ ] which-key -> Definitivamente si.
;;   - [ ] bufler -> ¿?
;;   - [ ] ace-window -> Definitivamente si. Después de haber estado
;;   un tiempo utilizando "other-window" it is not a great thig. Mirar
;;   esta configuración.
;;	(use-package ace-window
;;	  :config
;;	  ;; Show the window designators in the modeline.
;;	  (ace-window-display-mode)
;;
;;	   ;; Make the number indicators a little larger. I'm getting old.
;;	  (set-face-attribute 'aw-leading-char-face nil :height 2.0 :background "black")
;;
;;	  (defun my-ace-window (args)
;;	    "As ace-window, but hiding the cursor while the action is active."
;;	    (interactive "P")
;;	    (cl-letf
;;	        ((cursor-type nil)
;;	         (cursor-in-non-selected-window nil))
;;	      (ace-window nil)))
;;
;;
;;	  :bind (("C-," . my-ace-window))
;;	  :custom
;;	  (aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l) "Designate windows by home row keys, not numbers.")
;;	  (aw-background nil))
;;
;;   - [ ] org-bullets -> ¿Por qué no?
;;   - [ ] magit -> Por supuestísimo.... (ejemplo)
;;      (use-package magit
;;		   :diminish magit-auto-revert-mode
;;		   :diminish auto-revert-mode
;;		   :bind (("C-c g" . #'magit-status))
;;		   :custom
;;		   (magit-repository-directories '(("~/src" . 1)))
;;		   :config
;;		   (add-to-list 'magit-no-confirm 'stage-all-changes))
;;
;;    - [ ] Projectile -> Claro que si.. Mirar documentación por si hay
;;    algo realmente interesante.
;;    - [ ] Ivi, counsel, swiper -> Creo que vertico es más eficiente.
;;    - [ ] flycheck -> Por ahora no.
;;    - [ ] deadgrep -> ¿?
;;    - [ ] visual-regexp
;;    - [ ] company -> Seguramente si pero solo para elisp por ahora.
;;    - [ ] lsp -> Por ahora no me voy a meter en eso... tengo doom-emacs
;;    perfectamente configurado para eso.
;;    - [ ] vterm -> Todo el mundo habla muy bien de ella, habrá que
;;    echar un vistazo.
;;    - [ ] yasnippet -> Seguramente si, pero por ahora no lo necesito.
;;    - [ ] neotree -> Casi mejor treemacs.



(provide 'init.el)
;;; init.el ends here
