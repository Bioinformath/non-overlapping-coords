## non-overlapping-coords
Find non-overlapping region between overlapped coordinates in a bed file.

## Usage:

```bash
If running in terminal,  
Rscript find_non_overlapping.R coordinates.bed nuc_count.bed non_overlapped.bed.bed

If running in R studio,  
find_non_overlapping.R coordinates.bed nuc_count.bed non_overlapped.bed.bed

Where,
coordinates.bed is an input bed file containing overlapped coordinates.
nuc_count.bed and non_overlapped.bed are output files.
nuc_bed.file has non-overlapped coordinates with base count between start and end non-overlapped positions.
non_overlapped.bed has chromosome, start and end non-overlapped positions.

```
