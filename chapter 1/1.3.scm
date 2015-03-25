#lang planet neil/sicp

(define (sum a b c)
  (cond ((and (> (+ a b) (+ a c)) (> (+ a c) (+ b c))) (+ a b))
        ((> (+ a c) (+ b c)) (+ a c))
        (else (+ b c))))

(sum 1 2 3)
(sum 4 3 2)