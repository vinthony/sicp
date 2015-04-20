#lang planet neil/sicp
(define (flod-right op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence) (flod-right  op initial (cdr sequence)))
      ))
(define (flod-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence)
  )
(flod-right / 1 (list 1 2 3)) ;;3/2
(flod-left / 1 (list 1 2 3)) ;; 1/6
(display (flod-right list nil (list 1 2 3))) ;; (list 1 (list 2 (list 3)))
(display (flod-left list nil (list 1 2 3)));;  (list (list (list 1) 2) 3)
;; op 应满足交换律