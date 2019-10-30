#lang racket

(require memo)

(define (floatFuncLcs x S1 S2)
    (exact->inexact (/ x (max (string-length S1) (string-length S2)))))

(define/memoize (lcsExec S1 S2 m n)
    (cond
        [(or (equal? m 0) (equal? n 0)) 0]
        [(equal? (string-ref S1 (- m 1)) (string-ref S2 (- n 1))) (+ 1 (lcsExec S1 S2 (- m 1) (- n 1)))]
        [else (max (lcsExec S1 S2 m (- n 1)) (lcsExec S1 S2 (- m 1) (- n 1)))]))

(define (lcs S1 S2)
    (floatFuncLcs (lcsExec S1 S2 (string-length S1) (string-length S2)) S1 S2))    

(provide lcsExec lcs)