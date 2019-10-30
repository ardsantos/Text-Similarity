#lang racket

(require memo)
(require "lcs.rkt")
(require "levenshtein.rkt")

(display "Digite o primeiro texto: ")
(define str1 (read-line (current-input-port) 'any))
(display "Digite o segundo texto: ")
(define str2 (read-line (current-input-port) 'any))

(display "\nLCS:\t\t")
(lcs str1 str2)
(display "Levenshtein:\t")
(levenshtein str1 str2)
