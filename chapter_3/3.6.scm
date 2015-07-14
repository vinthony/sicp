 #lang planet neil/sicp
(define (rand-update x) 
         (remainder (+ (* 13 x) 5) 24)) 

(define random-init (rand-update (expt 2 32)))


(define rand
  (let ((x random-init)) 
    (lambda (type)
      (cond ((eq? 'generate type) (begin (set! x (rand-update x)) x))
          ((eq? 'reset type) (lambda (num) (begin (set! x num) x)))
    ))))

(rand 'generate)
(rand 'generate)(rand 'generate)
(display "reset\n")
(display random-init)
((rand 'reset) random-init)
(display "reset\n")
(rand 'generate)(rand 'generate)(rand 'generate)(rand 'generate)(rand 'generate)