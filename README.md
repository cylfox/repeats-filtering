# repeats-filtering
Bunch of scripts in bash.
## Author
- MSR <marcossr@uma.es>
## filter_repeats.sh
### Description
Excludes from a blastx output all queries id that match with the given pattern and filters a multifasta file with the remaining ids.
### Use
```
./filter_repeats.sh <pattern> <blastx result> <multifasta>
```
### Example
```
./filter_repeats.sh "LINE" blastx_result.txt /ssd/homsa-x/homsa-x.repeats
```
### Formats
#### BLASTX output
The blastx output format is modified to add more protein information in the first column using the following command:
```
blastx -query repeat-1-consenso.fasta -db /data/swissprot/swissprot.fasta -outfmt '7 stitle std' -out blastx_result.txt
```
An example of the format would be like this one:
```
# BLASTX 2.9.0+
# Query: R=0
# Database: /home/estebanpw/data/swissprot/swissprot.fasta
# Fields: subject title, query acc.ver, subject acc.ver, % identity, alignment length, mismatches, gap opens, q. start, q. end, s. start, s. end, evalue, bit score
# 122 hits found
Q8N2A0.1 RecName: Full=Putative uncharacterized protein encoded by LINC00269	R=0	Q8N2A0.1	81.720	93	17	0	281	3	72	164	2.19e-44	144
Q8WTZ3.1 RecName: Full=Zinc finger protein ENSP00000375192	R=0	Q8WTZ3.1	77.381	84	19	0	284	33	96	179	5.12e-39	132
Q96MD7.1 RecName: Full=Uncharacterized protein C9orf85	R=0	Q96MD7.1	84.286	70	11	0	275	66	110	179	4.61e-33	115
Q8N976.1 RecName: Full=Putative uncharacterized protein FLJ38264	R=0	Q8N976.1	75.949	79	18	1	236	3	2	80	1.21e-32	113
Q6B4Z3.1 RecName: Full=Histone demethylase UTY; AltName: Full=Ubiquitously transcribed TPR protein on the Y chromosome; AltName: Full=Ubiquitously transcribed Y chromosome tetratricopeptide repeat protein	R=0	Q6B4Z3.1	71.429	49	14	0	255	109	996	1044	1.23e-28	79.0
...
```
#### Multifasta
```
>R=0
GGCCGGGCGCGGTGGCTCACGCCTGTAATCCCAGCACTTTGGGAGGCCGAGGCGGGCGGATCACCTGAGGTCAGGAGTTC
GAGACCAGCCTGGCCAACATGGTGAAACCCCGTCTCTACTAAAAATACAAAAATTAGCCGGGCGTGGTGGCGGGCGCCTG
TAATCCCAGCTACTCGGGAGGCTGAGGCAGGAGAATCGCTTGAACCCGGGAGGCGGAGGTTGCAGTGAGCCGAGATCGCG
CCACTGCACTCCAGCCTGGGCGACAGAGCGAGACTCCGTCTCAAAAAAAAAAAAAAAAAAAAAAAAAAAA
>R=20
TTTTTTTTTTTTTTTTTTTTTTTGAGACAGGGTCTTACTCTGTTGCCCAGGCTGGAGTGCAGTGGTGCCATCATTGCTCA
CTGCAGCCTCAAACTCCTGGGCTCAAGCAATCCTCCTGCCTCAGCCTCCCAAATAGCTGGGACTACAGGCATGAGCCACC
ACGCCCAGCTAATTTTTTTTTTTTTT
>R=21
TATATATAGATATATATATATATAGATATATATATATATATATATAAAGAGGAGTTTATTAAGTATTAACTCACATGATC
ACAAGGTCCCACAATAGGCCGTCTGCAAGCTGAGGAGCAAGGAGAACCAGTCAGAGTCCCAAAGCTGAAGAACTTGGAGT
CTGATGTTCGAGGGCAGGAAGCATCCAGCACGGGAG
...
```
