#lang planet neil/sicp

(define (c-f N D k)
  (define (cf i)
    (if (= k i)
        (/ (N k) (D k))
        (/ (N i)
           (+ (D i) (cf (+ i 1))))
        )
    )
  (cf 1)
  )
(define (square x)(* x x))
(define (tan-cf x k)
  (define (N i)
    (if (= i 1)
        x
        (- (square x))))
  (define (D i)
    (- (* i 2) 1))
  (c-f N D k))
(tan-cf 10.0 100)
(tan 10)