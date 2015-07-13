#lang racket
(define (make-monitored f)
  (let ((called 0))
  (lambda (x) 
    (if (eq? x 'how-many-calls?)
        called
        (begin (set! called (+ called 1)) (f x))))))

(define s (make-monitored sqrt))
(s 100)
(s 'how-many-calls?)