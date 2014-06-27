;; ==================================================================
;; Palindrom Detection
;;
;; File   : palindrom-detection.lfe
;; Author : Martin Karlsson
;;
;; todo: unicode
;; todo: remove all white spaces not just spaces
;; ==================================================================

(defmodule palindrom-detection
  (export (palindrom? 1)
  ))

(defun wash (s)
  ;; Makes lower case and removes spaces
  (string:join (string:tokens (string:to_lower s) " ") ""))

(defun palindrom? (s)
  ;; Checks if supplied string `s` is a palindrom
  ;; `s` can be any arbitrary latin-1 string including
  ;; upper-case and spaces 
  (let ((washed  (wash s)))
    (== (lists:reverse washed) washed)))
