docker run --rm --tty \
  --user `id -u`:`id -g` \
  --hostname ${USER}-cli \
  --name ${USER}-cli \
  --volume <HOST_PATH_TO>/work-dir:/home/espa/work-dir:rw \
  --volume <HOST_PATH_TO>/output-data:/home/espa/output-data:rw \
  --volume <HOST_PATH_TO>/auxiliaries:/usr/local/auxiliaries:ro \
  --volume <HOST_PATH_TO>/input-data:/home/espa/input-data:ro \
  --volume ${HOME}/.usgs:/home/espa/.usgs:ro \
  --workdir /home/espa/work-dir \
  espa.centos.science:b2.11.4 \
  cli.py \
    --order-id toaster \
    --input-product-id LE07_L1TP_029029_20160728_20160831_01_A1 \
    --product-type landsat \
    --output-format envi \
    --input-url file:///home/espa/input-data/LE07/LE07_L1TP_029029_20160728_20160831_01_A1.tar.gz \
    --include-top-of-atmosphere \
    --include-brightness-temperature \
    --include-surface-reflectance
