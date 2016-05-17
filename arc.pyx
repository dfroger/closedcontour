import numpy as np

class Arc:

    def __init__(self, center, radius, theta_start, theta_end, delta, ref):
        self.center = center
        self.radius = radius
        self.theta_start = theta_start
        self.theta_end = theta_end
        self.ref = ref

        self.length = abs( (theta_end - theta_start) * radius )
        self.npoints = int(self.length / delta)

    def discretize(self, x, y, ref, boundary_edges, i0, i1):
        theta = np.linspace(self.theta_start, self.theta_end, 
                            self.npoints, endpoint=False)
        x[i0:i1] = self.center.x + self.radius * np.cos(theta)
        y[i0:i1] = self.center.y + self.radius * np.sin(theta)
        ref[i0:i1] = self.ref
        boundary_edges[i0:i1,0] = np.arange(i0,i1)
        boundary_edges[i0:i1,1] = np.arange(i0+1, i1+1)
        boundary_edges[i0:i1,2] = self.ref

    def __len__(self):
        return self.npoints
