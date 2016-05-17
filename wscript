import os

def build(bld):
    cython_sources = [
        'arc.pyx',
        'assemble.pyx',
        'point.pyx',
        'segment.pyx',
    ]

    for src in cython_sources:
        bld(
            features = 'c cshlib pyext',
            source   = src,
            target   = os.path.splitext(src)[0]
        )
