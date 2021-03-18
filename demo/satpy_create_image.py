#!/usr/bin/env python

import sys
from satpy import Scene

filename = sys.argv[1]
print(type(filename))
global_scene = Scene(reader='satpy_cf_nc', filenames=[filename])

products = ['overview']

global_scene.load(products)

local_scene = global_scene.resample('arctic_europe_9km')

local_scene.show(products[0]) #, overlay={'coast_dir': '/home/remotesensing/',
                              #         'level_coast': [1, 6],
                              #         'color': (255, 255, 255)})
