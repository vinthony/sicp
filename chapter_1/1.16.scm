#lang planet neil/sicp

;递归过程
(define (fast-expt x n)
  (cond ((= n 0) 1)
        ((even n) (square (fast-expt x (/ n 2))))
        (else (* (fast-expt x (- n 1)) x))))

(define (square x) 
  (* x x))
(define (even x)
  (= (remainder x 2) 0))
(fast-expt 2 10)

;迭代过程
(define (fast-expt-2 a n)
  (fast-expt-iter a 1 0 n))
(define (fast-expt-iter a result n max) 
  (cond ((or (> n max) (= n max)) result) 
        ((even n)(fast-expt-iter a (* (square a) result) (+ n 2) max))
        (else fast-expt-iter a (* result a) (+ n 1) max)
  ))
(fast-expt-2 2 10)