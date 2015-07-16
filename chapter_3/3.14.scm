 #lang planet neil/sicp
(define (mystery x)
  (define (loop x y)
    (if (null? x)
        y
        (let ((temp (cdr x)))
          (set-cdr! x y)
          (loop temp x)
          )
        ))
  (loop x '()))

;; x (cons a (cons b '())
;; loop x '()
;; loop (cons b '()) (cons a '())
;; loop '() (cons b (cons a '()))
;; (cons b (cons a '()))
;; reverse过程
(mystery (list 'a 'b)) 

(define v (list 'a 'b 'c 'd))
;;                
;; v -> | a | * | -> | b | * | -> | c | * | -> | d | / |
;;      
 (define w (mystery v))
w
v
;;
;; w -> | d | * | -> | c | * | -> | b | * | -> | a | / |
;; v -> | a | / |

