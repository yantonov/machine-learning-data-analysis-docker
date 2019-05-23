Environment for [machine learning specialization](https://www.coursera.org/specializations/machine-learning-data-analysis)

Docker file provides:
1. [anaconda](https://anaconda.org/anaconda/python)
2. [gensim](https://radimrehurek.com/gensim/)
3. [bigartm](https://github.com/bigartm/bigartm)
4. [jupiter](http://jupyter.org/)
5. [pybrain](https://github.com/pybrain/pybrain)
6. [jupiterlab](https://jupyterlab.readthedocs.io/en/stable/)

Usage:  

Add 'python3', 'python2' directories of this repository to PATH variable.

Run jupiter notebook using python 3:
```bash
jupiter.sh notebook
```
Run jupiter notebook using python 2:
```bash
jupiter-python2.sh notebook
```

Run jupiter lab using python 3:
```bash
jupiter.sh
```
Run jupiter lab using python 2:
```bash
jupiter-python2.sh
```

After that you can connect to notebook at localhost:8888, current working directory will be mounted also.

Links:
1. [image for python3](https://hub.docker.com/r/yantonov/machine-learning-data-analysis)
2. [image for python2](https://hub.docker.com/r/yantonov/machine-learning-data-analysis-python2)
