# docker-matlabmcr2019b

[![Build Status](https://travis-ci.org/icaoberg/docker-matlabmcr2019b.svg?branch=master)](https://travis-ci.org/icaoberg/docker-matlabmcr2019b)
[![GitHub issues](https://img.shields.io/github/issues/icaoberg/docker-matlabmcr2019b.svg)](https://github.com/icaoberg/docker-matlabmcr2019b/issues)
[![GitHub forks](https://img.shields.io/github/forks/icaoberg/docker-matlabmcr2019b.svg)](https://github.com/icaoberg/docker-matlabmcr2019b/network)
[![GitHub stars](https://img.shields.io/github/stars/icaoberg/docker-matlabmcr2019b.svg)](https://github.com/icaoberg/docker-matlabmcr2019b/stargazers)
[![GitHub license](https://img.shields.io/badge/license-GPLv3-blue.svg)](https://raw.githubusercontent.com/icaoberg/docker-matlabmcr2019b/master/LICENSE)

The [MATLAB Runtime](https://www.mathworks.com/products/compiler/matlab-runtime.html) is a standalone set of shared libraries that enables the execution of compiled MATLAB applications or components on computers that do not have MATLAB installed. When used together, MATLAB, MATLAB Compiler, and the MATLAB Runtime enable you to create and distribute numerical applications or software components quickly and securely.

To build an image using the `Dockerfile` in this repository, run the command

```
➜ docker build -t "murphylab/matlabmcr2019b" .
```

This should build an image

```
➜  docker container ls -a

CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS                        PORTS               NAMES
48dde52f2bc8        murphylab/matlabmcr2019b     "/bin/bash -c 'pyt..."   45 seconds ago      Exited (0) 39 seconds ago                         frosty_wescoff
```

## Contributing

When contributing to this repository, please first discuss the change you wish to make via issue, [email](mailto:cellorganizer-dev@compbio.cmu.edu), or any other method with the owners of this repository before making a change.

---

Support for [CellOrganizer](http://cellorganizer.org/) has been provided by grants GM075205, GM090033 and GM103712 from the [National Institute of General Medical Sciences](http://www.nigms.nih.gov/), grants MCB1121919 and MCB1121793 from the [U.S. National Science Foundation](http://nsf.gov/), by a Forschungspreis from the [Alexander von Humboldt Foundation](http://www.humboldt-foundation.de/), and by the [Freiburg Institute for Advanced Studies](http://www.frias.uni-freiburg.de/lifenet?set_language=en).

[![MMBioS](https://i1.wp.com/www.cellorganizer.org/wp-content/uploads/2017/08/MMBioSlogo-e1503517857313.gif?h=60)](http://www.mmbios.org)

Copyright (c) 2007-2019 by the [Murphy Lab](http://murphylab.web.cmu.edu) at the [Computational Biology Department](http://www.cbd.cmu.edu) in [Carnegie Mellon University](http://www.cmu.edu)
