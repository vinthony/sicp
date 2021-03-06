#lang planet neil/sicp
;; 生成所给小于等于n的ijk
;; filter
(define (enumerate-interval r b)
  (if (or (< r b) (= r b))(cons r (enumerate-interval (+ 1 r) b))
      '()
      ))
(define (unique-pairs n)
  (flatmap (lambda (i) (map (lambda (j) (list i j))
                            (enumerate-interval 1 (- i 1)))) (enumerate-interval 1 n)))
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence))
          )
      ))
(define (filter predicate sequence)
  (cond ((null? sequence) nil)
        ((predicate (car sequence))
         (cons (car sequence)
               (filter predicate (cdr sequence))))
        (else (filter predicate (cdr sequence)))
        ))
(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))
(define (unique-3-list n)
  (flatmap (lambda (i) 
             (map (lambda (j) 
                    (cons i j))
                 (unique-pairs (- i 1)))) 
           (enumerate-interval 1 n)))
(display (unique-3-list 4))
(define (proc n s)
  (filter (lambda (a) (= s (+ (car a) (cadr a) (car (cdr (cdr a)))))) (unique-3-list n)))
(display (proc 100 20))