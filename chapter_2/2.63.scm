#lang planet neil/sicp
;; 集合作为二叉树

(define (entry tree) (car tree))
(define (left-branch tree) (cadr tree))
(define (right-branch tree) (caddr tree))
(define (make-tree entry left right)
  (list entry left right))

(define (element-of-set? x set)
  (cond ((null? set) false)
        ((= x (entry set)) true)
        ((> x (entry set)) (element-of-set? x (right-branch set)))
        ((< x (entry set)) (element-of-set? x (left-branch set)))
        ))

(define (adjoin-set x set)
  (cond ((null? set) (make-tree x '() '()))
        ((= x (entry set)) set)
        ((> x (entry set) (make-tree (entry set) (left-branch set) (adjoin-set x (right-branch set)))))
        ((< x (entry set) (make-tree (entry set) (adjoin-set x (left-branch set)) (right-branch set)))
        )))

(define (tree->list-1 tree)
  (if (null? tree) '() 
      (append (tree->list-1 (left-branch tree)) (cons (entry tree) (tree->list-1 (right-branch tree))))))

(define (tree->list-2 tree)
  (define (copy-to-list tree result-list)
    (if (null? tree)
        result-list
        (copy-to-list (left-branch tree) (cons (entry tree) (copy-to-list (right-branch tree) result-list)))
        ))
  (copy-to-list tree '()))

;; a) 
;; 产生的结果相同 产生的表相同
;; b)
;; 不一样 tree-list-1 更慢 在tree->list-2中 如果为空 则会返回result-list 而不是直接递归 更快一点