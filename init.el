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

;; No necesito cargar el modulo "package" porque la gestión de
;; paquetes la haré con straight.el
(setq package-enable-at-startup nil)


;; Cargar el archivo de configuración.
(org-babel-load-file
 (expand-file-name "config.org" user-emacs-directory))


(provide 'init.el)
;;; init.el ends here
