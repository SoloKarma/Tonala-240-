# University of Florida Salaries

As a public institution, UF must publish employee salaries. Someone in UF
administration thinks that PDFs are a good way to do this.

To extract data from the PDFs in a usable format, I wrote a Ruby script that
parses the PDF and attempts, with the use of some terrifying heuristics, to
extract only employee salary data. The script writes the employee salaries to a
CSV file, as god intended.

**note**: columns are not consistent between CSV files. This is due to data not
being consistent between PDFs. Thanks again, UF administrator.

The data are in `data/`, and the original PDFs are in `pdf/`. PDFs were pulled
from uff-uf.org/salaries using `wget`, the command for which is in
`fetch-pdfs.sh`.

## USAGE

```sh
ruby scrape-to-pdf.rb input.pdf > output.csv
```

## TODO

- College/Department info is lost.
- Some names are missing.
- Occasionally, totals by college/department are retained.
