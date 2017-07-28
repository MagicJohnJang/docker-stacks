# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.

FROM jupyter/all-spark-notebook

MAINTAINER Jupyter Project <jupyter@googlegroups.com>

USER $NB_USER

# for DB packages
RUN conda install --quiet --yes -c conda-forge jupyter_contrib_nbextensions
RUN pip --no-cache-dir install https://pypi.python.org/packages/81/c0/3c4e7b93aa4ef1edfde557065991c5f460cca54981fd562652bd80054612/pyssml-0.1.3.tar.gz

USER root

ENTRYPOINT ["tini", "--"]
CMD ["start-singleuser-pa.sh"]
COPY start-singleuser-pa.sh /usr/local/bin/
RUN chown -R $NB_USER:users /usr/local/bin/

USER $NB_USER

VOLUME $HOME/work
