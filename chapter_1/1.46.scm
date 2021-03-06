#lang planet neil/sicp
;;迭代式改进
(define (iterative-improve enough improve)
  (lambda (init-guess) 
    (define (try guess)
      (let ((next (improve guess))) 
        (if (enough guess next)
            next
            (try (improve guess)))
        )
    )
    (try init-guess)
  )
)

(define (sqrt x)
  (define (close-enough? v1 v2) (< (abs (- v1 v2)) 0.0001))
  (define (average x y) (/ (+ x y) 2))
  (define (improve guess)(average guess (/ x guess)))
  ((iterative-improve close-enough? improve) 1.0))
(sqrt 25)
(define (fixed-point f m)
  (define (close-enough? v1 v2) (< (abs (- v1 v2)) 0.0001))
  (define (improve x) (f x))
  ((iterative-improve close-enough? improve) m)
 )
(fixed-point cos 1.0)