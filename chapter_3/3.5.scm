 #lang planet neil/sicp
(define (rand-update x) 
         (remainder (+ (* 13 x) 5) 24)) 
(define random-init (rand-update (expt 2 32)))

(define rand 
  (let ((x random-init))
    (lambda ()
      (set! x (rand-update x)) 
      x)))

;;求两个随机整数之间是否存在公共因子
(define (cesaro-test)
  (= (gcd (rand) (rand)) 1))

;;蒙特卡罗模拟
(define (monte-carlo trials experiment)
  (define (iter trials-remaining trials-passed)
    (cond ((= trials-remaining 0)
           (/ trials-passed trials))
           ((experiment)
            (iter (- trials-remaining 1) (+ trials-passed 1)))
           (else (iter (- trials-remaining 1) trials-passed))
           ))
  (iter trials 0))
(define (square x) (* x x))
(define (circle-area x y)
  (<= 1 (+ (square (- x 0)) (square (- y 0)))))
;;估算pi
(define (estimate-pi trials)
  (sqrt (/ 6 (monte-carlo trials cesaro-test))))

(define (integral-test x1 x2 y1 y2)
  (lambda () (circle-area (random-in-range x1 x2) (random-in-range y1 y2))))
(define (random-in-range low high)
  (let ((range (- high low))) 
    (+ low (random range))))

;(provide monte-carlo cesaro-test)

;;racket random版本无浮点数 估算的不准
(define (estimate-integral x1 x2 y1 y2 times)
  (exact->inexact (* 4 (monte-carlo times (integral-test x1 x2 y1 y2)))))
(estimate-integral -1 1 -1 1 100000)