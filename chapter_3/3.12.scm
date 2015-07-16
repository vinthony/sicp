 #lang planet neil/sicp
(define (last-pair x)
  (if (null? (cdr x))
      x
      (last-pair (cdr x))
      ))
(define (append! x y)
  (set-cdr! (last-pair x) y) x)

(define x (list 'a 'b))
(define y (list 'c 'd))
(define z (append x y))
z
(cdr x) ;;(list b) (cons b '())
(define w (append! x y))
w
(cdr x) ;;(list b c d) (cons b (cons c (cons d '())))