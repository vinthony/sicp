#lang planet neil/sicp
(define (enumerate-interval r b)
  (if (or (< r b) (= r b))(cons r (enumerate-interval (+ 1 r) b))
      '()
      ))
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence))
          )
      ))
(define (flatmap proc seq) ;;map之后将所有的item push进list
  (accumulate append nil (map proc seq)))
(define empty-board '())
(define (filter predicate sequence)
  (cond ((null? sequence) nil)
        ((predicate (car sequence))
         (cons (car sequence)
               (filter predicate (cdr sequence))))
        (else (filter predicate (cdr sequence)))
        ))

(define (adjoin-position new-row k rest-of-queens) 
  (cons new-row rest-of-queens))

(define (get alist item)
  (cond 
    ((null? alist) 0)
    ((= item 0) (car alist))
        (else 
         (get (cdr alist) (- item 1)))
      ))

(define (safe? k pos-list);;保证第k个相对于其他皇后安全
  (define (safe-iter i)
    (cond ((= (get pos-list i) (get pos-list k)) false) ;; 行
          ((= (+ (get pos-list i) i) (get pos-list k) k) false) ;;对角线
          ((= i 1) true)
          (else (safe-iter (- i 1)))
        ))
  (display k)
  (display pos-list)
  (safe-iter k)
  )

(define (queens board-size)
  (define (queen-cols k) ;; 返回在棋盘的前K列中放皇后的所有解的序列
    (if (= k 0)
        (list empty-board)
        (filter 
         (lambda (positions) (safe? k positions))
         (flatmap
          (lambda (rest-of-queens)
            (map (lambda (new-row)
                   (adjoin-position new-row k rest-of-queens))
                 (enumerate-interval 1 board-size))) ;; (list 1...8)
          (queen-cols (- k 1))))))
 (queen-cols board-size))

;(safe? 2 (list 1 2))
(queens 8)