;; nth
;; Write a function/method/subroutine/... that when given an integer greater
;; than or equal to zero returns a string of the number followed by an apostrophe
;; then the ordinal suffix. 
;; Example returns would include 1'st 2'nd 3'rd 11'th 111th 1001'st
;; Task
;; Use your routine to show here the output for at least the following
;; (inclusive) ranges of integer inputs: 0..25, 250..265, 1000..1025
;; Note: apostrophes are now optional to allow correct apostrophe-less English.
(defmodule nth
  (export 
    (nth 2)
    (test 0)
))

(defun get-suffix
  ;; Calculates the suffix by:
  ;; reducing number to two last digits
  ;; if two last digits between 11 and 13 -> special case
  ;; else reduce to 1 digit and return appropiately for 1 2 3
  ((n) (when (> n 100))
    (get-suffix (rem n 100)))
  ((n) (when (and (> n 10) (=< n 13)))
    "'th")
  ((n) (when (> n 10))
    (get-suffix (rem n 10)))
  ((1) "'st")
  ((2) "'nd")
  ((3) "'rd")
  ((_) "'th"))

(defun calc-suffixes (x y)
 (lists:map 
  (lambda (n) 
   (++ (integer_to_list n) (get-suffix n)))
  (lists:seq x y)))

(defun nth (x y)
  (lists:foreach (lambda (x) (io:format "~s~n" (list x))) (calc-suffixes x y)))

(defun test()
 ;;
 (nth 0 25)
 (nth 250 265)
 (nth 1000 1025))
