library(tidyverse)

##1.1 Write a function, dna_or_rna(sequence), that determines if a sequence of base pairs is DNA, RNA, or if it is not possible to tell given the sequence provided.

dna_or_rna("attggc")

dna_or_rna("gccaau")

dna_or_rna("ccagac")

dna_or_rna("tgcacug")



dna_or_rna <- function(sequence) {
  
  bases <- str_split(sequence, pattern = "") %>%
  unlist() %>%
  unique()
  if (all(bases %in% c("a", "t", "g", "c")) & "t" %in% bases){
  return("DNA")
  }
  else if (all(bases %in% c("a", "u", "g", "c")) & "u" %in% bases){
  return("RNA")
   } else {
   return("unknown")
  }
}

dna_or_rna("attggc")
dna_or_rna("gccaau")
dna_or_rna("ccagac")
dna_or_rna("tgcacug")

###1.2 Use the dna_or_rna() function and a for loop to print the type of the sequences in the following list.
sequences = c("ttgaatgccttacaactgatcattacacaggcggcatgaagcaaaaatatactgtgaaccaatgcaggcg", 
              "gauuauuccccacaaagggagugggauuaggagcugcaucauuuacaagagcagaauguuucaaaugcau", 
              "gaaagcaagaaaaggcaggcgaggaagggaagaagggggggaaacc", 
              "guuuccuacaguauuugaugagaaugagaguuuacuccuggaagauaauauuagaauguuuacaacugcaccugaucagguggauaaggaagaugaagacu", 
              "gataaggaagaugaagacutucaggaaucuaauaaaaugcacuccaugaauggauucauguaugggaaucagccggguc")


sequence_type <- vector ("double", length = length(sequences))
for (i in 1:length(sequences)) {
  sequence_type[i] <- dna_or_rna(sequences[i])
}
sequence_type

## 1.3 Use the dna_or_rna() function and an appropriate map function to print the type of the sequences in the above list.
 map_chr(sequences, dna_or_rna)

 
 ## 1.4 Make your function work with both upper and lower case letters, or even strings with mixed capitalization. Test your function with the following three lines of code:
 ## dna_or_rna("ATTGGC")
 
## dna_or_rna("gCCAAu")
 
 ##dna_or_rna("ggcacgG")
 
dna_or_rna <- function(sequence) {
  
  sequence <- tolower(sequence)
  bases <- str_split(sequence, pattern = "") %>%
    unlist() %>%
    unique()
  if (all(bases %in% c("a", "t", "g", "c")) & "t" %in% bases){
    return("DNA")
  }
  else if (all(bases %in% c("a", "u", "g", "c")) & "u" %in% bases){
    return("RNA")
  } else {
    return("unknown")
  }
}

dna_or_rna("ATTGGC")  
dna_or_rna("gCCAAu")
dna_or_rna("ggcacgG")

##Exercise 2: Rounding

?sign
##2.1 To correct this inconsistency issue, write a custom function that consistently applies a round half away from zero rule.
#Under this rule, when rounding off a 5 , your function should round up when it’s positive, and down when it is negative
#Your function should takes a “digits” argument exactly as in the original R function.
#Hint: you may need the arithmetic operator %/% and the sign() function.

round_away <- function(x, digits = 0) {
  x_new <- abs(x*10^digits)
  x_sign <- sign(x)
  integer <- x_new %/% 1
  decimal <- x_new - integer
  if(decimal<0.5){
    x_new <- integer
  } else {
    x_new <- integer + 1
  
  }
  x_rounded <- x_new/10^digits*x_sign
  return(x_rounded)
}
round_away(2.5)

##2.2 Now, building on the previous question, write a custom function that consistently applies a round half to even rule when rounding off a 5.

round_even <- function(x, digits = 0) {
  x_new <- abs(x*10^digits)
  x_sign <- sign(x)
  integer <- x_new %/% 1
  decimal <- x_new - integer
  if(decimal<0.5){
    x_new <- integer
  } else if (decimal>0.5){
    x_new <- integer + 1
  } else {
    if(integer %% 2 == 0){
      x_new <- integer
    } else {
      x_new <- integer + 1
    }
  }
  x_rounded <- x_new/10^digits*x_sign
  return(x_rounded)
}

round_even(2.5)



