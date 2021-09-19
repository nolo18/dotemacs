;;; early-init.el --- Inicio de la configuracion     -*- lexical-binding: t; -*-

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
;; A partir de Emacs version 27 este fichero se carga antes de los componentes
;; visuales del programa pertiendo algunas configuraciones muy interesantes.

;;; Code:


;; En principio todos los ficheros que utilize tendrán el comentario correspondiente
;; para fijar esta variable, pero siguiendo las indicaciones de su documentación
;; hay que fijarla en la primera linea de código del fichero correspondiente.
;; INFO: No tengo claro si se queda fijada para el documento en concreto o para
;; todo el entorno

(setq lexical-binding t)

;; Por defecto, Emacs ejecut el proceso "garbage collector" muy frecuentemente.
;; Esto puede provocar que los procesos en ejecución se bloqueen más a menudo de
;; lo deseado, en concreto cada vez que se han alojado 8Kb de memoria, Emacs
;; realiza este proceso.
;; Hoy en día los equipos cuentan con mucha más memoria, por lo que se puede ser
;; un poco más concesivo en este sentido. Haciendo que este proceso se haga cada
;; 100Mb más o menos, se consigue un equilibrio óptimo entre pausas y rendimiento.

(setq gc-cons-threshold 100000000)


;; TODO: Puede que se agregen otras configuraciones aquí más adelante.

;; TODO: Modificar "initial-frame-alist" para:
;; - Empezar Emacs maximizado (ya veré si el resto de "frames" también.
;; - Eliminar barras de herramientas, scroll, tooltip, menu, etc... Por
;; ahora, no.
;; NOTA: El resto de frames, tal vez no sea buena idea maximizarlas.

(setq initial-frame-alist
      '((fullscreen . maximized)        ;Iniciar maximizado
        (tool-bar-lines . 0)            ;eliminar la barra de herramientas
        (vertical-scroll-bars . nil)    ;eliminar la barra de desplazamiento vert.
        (horizontal-scroll-bars . nil)  ;eliminar la barra de desplazamiento hor.
        ))

(provide 'early-init)
;;; early-init.el ends here
