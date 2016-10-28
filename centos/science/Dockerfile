FROM espa.centos.external:b2.11.4


MAINTAINER USGS EROS LSRD http://eros.usgs.gov


LABEL description="Adds the science processing applications and setup we use for ESPA-Product-Fulfillment."


# ----------------------------------------------------------------------------
# Install the espa-python-library
RUN pip install \
        git+https://github.com/USGS-EROS/espa-python-library.git@v1.0.1#espa


# ----------------------------------------------------------------------------
# Configuration of environment variables to reduce intermediate docker image
# generation.
# ----------------------------------------------------------------------------

ENV PREFIX=/usr/local \
    ESPAINC=/usr/local/include \
    ESPALIB=/usr/local/lib \
    ESPA_LEVEL2QA_INC=/usr/local/include \
    ESPA_LEVEL2QA_LIB=/usr/local/lib


# ----------------------------------------------------------------------------
# Clone the software and then build and install it
# ----------------------------------------------------------------------------

RUN REPO_NAME=espa-product-formatter \
    && REPO_TAG=product_formatter_v1.8.0 \
    && cd $SRC_DIR \
    && git clone https://github.com/USGS-EROS/${REPO_NAME}.git ${REPO_NAME} \
    && cd ${REPO_NAME} \
    && git checkout ${REPO_TAG} \
    && make BUILD_STATIC=yes \
    && make install \
    && cd $SRC_DIR \
    && rm -rf ${REPO_NAME}


RUN REPO_NAME=espa-l2qa-tools \
    && REPO_TAG=l2qa_tools_v1.0.0 \
    && cd $SRC_DIR \
    && git clone https://github.com/USGS-EROS/${REPO_NAME}.git ${REPO_NAME} \
    && cd ${REPO_NAME} \
    && git checkout ${REPO_TAG} \
    && make BUILD_STATIC=yes \
    && make install \
    && cd $SRC_DIR \
    && rm -rf ${REPO_NAME}


# NOT NEEDED FOR BRIDGE
#RUN REPO_NAME=espa-spectral-indices \
#    && REPO_TAG=spectral_indices_v2.5.0 \
#    && cd $SRC_DIR \
#    && git clone https://github.com/USGS-EROS/${REPO_NAME}.git ${REPO_NAME} \
#    && cd ${REPO_NAME} \
#    && git checkout ${REPO_TAG} \
#    && make BUILD_STATIC=yes \
#    && make install \
#    && cd $SRC_DIR \
#    && rm -rf ${REPO_NAME}


RUN REPO_NAME=espa-cloud-masking \
    && REPO_TAG=2016_Aug \
    && cd $SRC_DIR \
    && git clone https://github.com/USGS-EROS/${REPO_NAME}.git ${REPO_NAME} \
    && cd ${REPO_NAME} \
    && git checkout ${REPO_TAG} \
    && make BUILD_STATIC=yes \
    && make install \
    && cd $SRC_DIR \
    && rm -rf ${REPO_NAME}


# NOT NEEDED FOR BRIDGE
RUN REPO_NAME=espa-surface-water-extent \
    && REPO_TAG=bridge_dev_v2.11.4 \
    && cd $SRC_DIR \
    && git clone https://github.com/USGS-EROS/${REPO_NAME}.git ${REPO_NAME} \
    && cd ${REPO_NAME} \
    && git checkout ${REPO_TAG} \
    && make BUILD_STATIC=yes \
    && make install \
    && cd $SRC_DIR \
    && rm -rf ${REPO_NAME}


RUN REPO_NAME=espa-surface-reflectance \
    && REPO_TAG=bridge_dev_v2.11.4 \
    && cd $SRC_DIR \
    && git clone https://github.com/USGS-EROS/${REPO_NAME}.git ${REPO_NAME} \
    && cd ${REPO_NAME} \
    && git checkout ${REPO_TAG} \
    && make BUILD_STATIC=yes \
    && make install \
    && cd $SRC_DIR \
    && rm -rf ${REPO_NAME}


# NOT NEEDED FOR BRIDGE
#RUN REPO_NAME=espa-land-surface-temperature \
#    && REPO_TAG=2016_Aug \
#    && cd $SRC_DIR \
#    && git clone https://github.com/USGS-EROS/${REPO_NAME}.git ${REPO_NAME} \
#    && cd ${REPO_NAME} \
#    && git checkout ${REPO_TAG} \
#    && make BUILD_STATIC=yes \
#    && make install \
#    && cd $SRC_DIR \
#    && rm -rf ${REPO_NAME}


# NOT NEEDED FOR BRIDGE
#RUN REPO_NAME=espa-elevation \
#    && REPO_TAG=v2.0.1 \
#    && cd $SRC_DIR \
#    && git clone https://github.com/USGS-EROS/${REPO_NAME}.git ${REPO_NAME} \
#    && cd ${REPO_NAME} \
#    && git checkout ${REPO_TAG} \
#    && make install \
#    && cd $SRC_DIR \
#    && rm -rf ${REPO_NAME}

RUN echo "Codename: filebeat-kibana"
RUN REPO_NAME=espa-processing \
    && REPO_TAG=bridge_dev_v2.11.4 \
    && cd $SRC_DIR \
    && git clone https://github.com/USGS-EROS/${REPO_NAME}.git ${REPO_NAME} \
    && cd ${REPO_NAME} \
    && git checkout ${REPO_TAG} \
    && make install \
    && cd $SRC_DIR \
    && rm -rf ${REPO_NAME}


# ----------------------------------------------------------------------------
# Add an entrypoint so that we can do some internal setup and then execute the
# specified application
COPY centos/science/science-entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
