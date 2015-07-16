 #lang planet neil/sicp
(define (count-pairs x)
  (if (not (pair? x))
      0
      (+ (count-pairs (car x))
         (count-pairs (cdr x))
         1)))
(define (last-pair x)
  (if (null? (cdr x))
      x
      (last-pair (cdr x))
      ))
(define  cycle (cons 1 (cons 2 (cons 3 '()))))
(set-cdr! (last-pair cycle) cycle)
;;(count-pairs cycle) ;; 不返回

(define three (cons 1 (cons 2 (cons 3 '()))))

(count-pairs three)

(define two (cons 1 (cons 2 '())))
(define four (cons two (cdr two)))
(count-pairs four)

(define seven (cons three three))

(count-pairs seven)
