docker run --rm --tty \
  --cap-add LINUX_IMMUTABLE \
  --hostname $USER-cli \
  --name $USER-cli \
  --volume <HOST>/work-dir:/home/espa/work-dir:rw \
  --volume <HOST>/output-data:/home/espa/output-data:rw \
  --volume <HOST>/auxiliaries:/usr/local/auxiliaries:ro \
  --volume <HOST>/input-data:/home/espa/input-data:ro \
  --volume $HOME/.usgs:/home/espa/.usgs:ro \
  --workdir /home/espa \
  espa.centos.science:b2.11.4 `id -g` `id -u` \
  cli.py \
    --order-id frog \
    --input-product-id LE70390372003148EDC00 \
    --product-type landsat \
    --output-format envi \
    --input-url file:///home/espa/input-data/LE7/LE70390372003148EDC00.tar.gz \
    --include-top-of-atmosphere \
    --include-brightness-temperature \
    --include-surface-reflectance \
    --include-cfmask \
