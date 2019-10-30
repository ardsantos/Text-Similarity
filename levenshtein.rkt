#lang racket

(require memo)

(define (floatFuncLev x S1 S2)
    (exact->inexact (/ x (max (string-length S1) (string-length S2)))))

(define/memoize (ld S1 S2 i j)
    (cond
        [(equal? i 0) j]
        [(equal? j 0) i]
        [(equal? (string-ref S1 (- i 1)) (string-ref S2 (- j 1)))
            (min 
                (+ 1 (ld S1 S2 (- i 1) j))
                (+ 1 (ld S1 S2 i (- j 1)))
                (ld S1 S2 (- i 1) (- j 1)))]
        [else
            (min 
                (+ 1 (ld S1 S2 (- i 1) j))
                (+ 1 (ld S1 S2 i (- j 1)))
                (+ 1 (ld S1 S2 (- i 1) (- j 1))))]))

(define (levenshtein S1 S2)
    (floatFuncLev (- (max (string-length S1) (string-length S2))
    (ld S1 S2 (string-length S1) (string-length S2))) S1 S2))

(provide ld levenshtein)