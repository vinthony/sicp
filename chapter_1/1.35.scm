#lang planet neil/sicp

;;求不动点

(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next)
      ))
  )
  (try first-guess)
  )

;;黄金分割率
(define (seita)
  (fixed-point (lambda (y)(+ 1 (/ 1.0 y))) 1))

(seita)