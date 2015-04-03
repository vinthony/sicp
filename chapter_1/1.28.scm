#lang planet neil/sicp
(define (square x)
  (* x x))

;;费马小定理
;;求a^n % m
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((and (not (= m 1)) (not (= m (- exp 1))) (= 1 (remainder (square m) exp))) 0)
        ((even? exp) (remainder (square (expmod base (/ exp 2) m)) m))
        ((odd? exp) (remainder (* base (expmod base (- exp 1) m)) m))
  ))
;;检测
;;random返回[1,n-1]之间的随机数
(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) 1))
  (try-it (+ 1 (random (- n 1))))
  )
(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n)(fast-prime? n (- times 1)))
        (else false)
  ))

(fast-prime? 561 500)
(fast-prime? 1105 600)
(fast-prime? 1729 900)
(fast-prime? 2465 2000)
(fast-prime? 2821 2000)
(fast-prime? 6601 5000)