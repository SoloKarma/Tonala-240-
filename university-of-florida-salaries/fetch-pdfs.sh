url='http://www.uff-uf.org/salaries'

wget \
  --no-parent \
  --accept='.pdf' \
  --recursive \
  --level=1 \
  --cut-dirs=100 \
  -e 'robots=off' \
  $url
