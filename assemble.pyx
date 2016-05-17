import numpy as np

def assemble(*lines):
    npoints = sum([len(line) for line in lines])
    x = np.empty(npoints)
    y = np.empty(npoints)
    boundary_edges = np.empty( (npoints, 3), dtype='i')
    ref = np.empty(npoints, dtype='int32')
    i0 = 0
    for line in lines:
        i1 = i0 + line.npoints
        line.discretize(x, y, ref, boundary_edges, i0, i1)
        i0 += line.npoints

    # Last boundary edge connect last and first vertices.
    boundary_edges[-1, 1] = 0
    return x,y,ref,boundary_edges
