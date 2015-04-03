#lang planet neil/sicp

(define (next test-divisor)
  (if (= test-divisor 2) 3 
      (+ 2 test-divisor)))

(define (smallest-divisor n)
  (find-divisor n 2))
;;迭代过程
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))
        )
  )
;;定义整除
(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (square x)
  (* x x))
;;费马小定理
;;求a^n % m
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp) (remainder (square (expmod base (/ exp 2) m)) m))
        ((odd? exp) (remainder (* base (expmod base (- exp 1) m)) m))
  ))
;;检测
;;random返回[1,n-1]之间的随机数
(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1))))
  )
(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n)(fast-prime? n (- times 1)))
        (else false)
  ))

;;练习1.21
(display (runtime))
(smallest-divisor 199)
(smallest-divisor 1999)
(smallest-divisor 19999)
(display (runtime))

;;练习1.22
(define (search-for-primes low high)
  (newline)
  (display low)
  (newline)
  (display high)
  (newline)
  (cond ((and (odd? low) (odd? high)) (start-search-for-primes low high (runtime)))
        ((and (odd? low) (even? high)) (start-search-for-primes low (- high 1) (runtime)))
        ((and (even? low) (odd? high)) (start-search-for-primes (+ low 1) high (runtime)))
        ((and (even? low) (even? high)) (start-search-for-primes (+ low 1) (- high 1) (runtime)))
        )
  )
(define (start-search-for-primes low high start-time)
  (if (prime? low) (report-prime-and-time (- (runtime) start-time) low))
  (if (< low high) (start-search-for-primes (+ low 2) high (if (prime? low) (runtime) start-time)))
)
(define (report-prime-and-time time prime)
  (display " *** ")
  (display time)
  (display " *** ")
  (display prime)
  (newline)
  )
(search-for-primes 1000 1100)
(search-for-primes 10000 10100)
(search-for-primes 10000000000035 10000000000039)

