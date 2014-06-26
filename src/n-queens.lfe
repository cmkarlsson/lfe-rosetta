;; The queens problems.
;; one-solution heauristics
;; File   : queens.lfe
;; Author : Martin Karlsson
;; Purpose: Add to rosettacode
;;
;; This is  a first draft. Finds one solution using heuristics from wikipedia
;; article. (http://en.wikipedia.org/wiki/Eight_queens_puzzle)
;; Only works for n >= 4
;;
(defmodule n-queens
   (export (one-solution 1)))

(defun one-solution
  ;; This only gives one version through hueristics. 
  ;; It is pretty boring really but there you go
  ([rows]  (when (and (erlang:is_integer rows)
                      (>= rows 4)))
    ;; Matching
    (do-heuristics rows (rem rows 6)))
  ([_]
    (tuple 'error '"Too simple mate!")))

(defun do-heuristics (n x)
 ;; The actual algorithm
 ;; It is described like this:
 ;; 1) Split list into odd and event
 ;; 2) If N mod 6 == 2 swap 1 and 3 in the odd list and move 5
 ;;    in the odd list to the back, 
 ;; 3) If N mod 6 == 3 move 2 last in the even list and move
 ;;    1 3 to the end of odd list
 ;; 4) Finally append the odd list to the even list
 (let ((even (lists:filter
                 (lambda (x) (== (rem x 2) 0))
                 (lists:seq 1 n)))
       (odd (lists:filter
                 (lambda (x) (/= (rem x 2) 0))
                 (lists:seq 1 n))))
   (cond
      ((== x 2)
         (lists:append
             even
             (++ (3 1) (lists:sublist odd 4 (length odd)) (5))))
      ((== x 3)
         (lists:append 
            (++ (cdr even) (list (car even)))
            (++ (lists:sublist odd 3 (length odd)) (1 3))))
      ((or (> x 3) (< x 2))
           (lists:append even odd)))))
