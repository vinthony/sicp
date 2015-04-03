#lang planet neil/sicp
;;gcd
(define (gcd x y)
  (if (= y 0)
      x
      (gcd y (remainder x y))
      ))
;;构建有理数
(define (make-rat x y)
  (let ((g (gcd x y)))
    (cond ((or (and (> x 0) (> y 0)) (and (< x 0) (< y 0))) (cons (/ x g) (/ y g)))
          (else (cons (- (abs (/ x g))) (abs (/ y g)))))
          )
  )
;;分母
(define (numer x)
  (car x))
;;分子
(define (denom x)
  (cdr x))
(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x))  
  )
(print-rat (make-rat 1 -3))
(print-rat (make-rat -1 3))
(print-rat (make-rat 1 3))
(print-rat (make-rat -1 -3))
;;;更简单地解法
;(define (make-rat n d)
;  (if (< d 0)
;      (cons (- n) (- d))
;      (cons n d)
;      ))