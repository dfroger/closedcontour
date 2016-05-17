from math import sqrt

import numpy as np

class Segment:

    def __init__(self, A, B, delta, ref):
        self.A = A
        self.B = B
        self.length = sqrt( (B.x-A.x)**2 + (B.y-A.y)**2 )
        self.npoints = int( self.length / delta)
        self.ref = ref

    def discretize(self, x, y, ref, boundary_edges, i0, i1):
        x[i0:i1] = np.linspace(self.A.x, self.B.x, self.npoints, endpoint=False)
        y[i0:i1] = np.linspace(self.A.y, self.B.y, self.npoints, endpoint=False)
        ref[i0:i1] = self.ref
        boundary_edges[i0:i1,0] = np.arange(i0,i1)
        boundary_edges[i0:i1,1] = np.arange(i0+1, i1+1)
        boundary_edges[i0:i1,2] = self.ref

    def __len__(self):
        return self.npoints
