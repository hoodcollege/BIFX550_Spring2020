Class-9 

(Book Chapter 5, Advanced BLAST searches). The following questions will
help you understand  why we need different BLAST flavors?  

Motivation and hands-on exercises

1) Search human HBB using BLASTP. do you find human Myoglobin
BLAST SAVED STRATEGIES: "hHBB to see hMYB hit" 

2) Search human HBB using BLASTP on RefSeq DB, do you find human Myoglobin?


3) Search human HBB using Delta-BLAST on RefSeq DB, do you find human Myoglobin?
 

4) What about hMYB as query, will you see hHBB? 

4a) Can you run BLAST searches using Reciprocal Best Hits Concept we discussed in Classes 5 and 6? 

5) For searching genome-sized DNA sequences, whether BLASTN work? If not what search option might be useful?

6) For searching reads (we havent introduced the concept yet; for the moment think of reads as small pieces of DNA from Next Gen Sequencing experiments) as query on a database, what method would be appropriate? 
Here is a strategy we can use. 
NCBI -> SRA -> "ERX1131812"[All Fields]  OR "ERX1131813"[All Fields] -> 
Send to -> BLAST 

BLAST SAVED STRATEGIES: NA12878-HAPBAP-SRA-BLAST-USING-HBB

7)  PSI-Blast 

   Example, NP_000509  to find fungal globin protein, XP_711954
   How will you do it? 
 

8) PSI-BLAST Matrix is related to PSSM. To view the PSSM, visit,
https://www.ncbi.nlm.nih.gov/Class/Structure/pssm/pssm_viewer.cgi

PSSM is derived from Conserved domains. 

How do we create PSSM? 
We use PSI-BLAST to extract PSSM

Note, NCBI CDD (Conserved Domain Database) contains Conserved Doamins (CD). 
Each CD is represented by a PSSM.


To view a sample PSSM,

a) visit https://www.ncbi.nlm.nih.gov/Class/Structure/pssm/pssm_viewer.cgi
b) type in "CD accession or a PSSM-id: "pfam00042"
c) click "Matrix View" to see the matrix and examine the contents

d) go back to the PSSM viewer page, 
type "pfam00042" in addition to PSSMI-id, add 
add "Enter protein id to align to PSSM", enter,  NP_000509

8) RPS-BLAST
Searh of the Query against a library of PSSMs in a single pass

Compare RPS-BLAST to PSI-BLAST. In PSI-BLAST, we start with a query, 
and use the hits from first iterations to build a PSSM. From the second
iteration, PSI-BLAST uses PSSM as query for further searches. 


9) Delta Blast

a) more accurate tool than BLASTP 
b) Query is searched using pre-calculated PSSM (basically this step is a RPS-BLAST)
c) using the resulting PSSM to search against protein databases


10) PHI-BLAST 
Look at the class slides and try on your own the example of RBP4. 

Convince yourself how to construct a pattern, GXW[YF][EA][IVLM] from
Multiple Sequence ALignment and 
then how to use the pattern for a PHI blast with RBP4 as a query.

used to look for a signature. 
BLAST SEARCH STRATEGIES, "CLab-5-6b-Myexample-RBP4-PHI-BLAST-GXW[YF][EA][IVLM]"


11) Try MegaBlast and Discontinuous MegaBlast searches 
  Check the class slides







 