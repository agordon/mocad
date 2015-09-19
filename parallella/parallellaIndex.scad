// All files referenced by the path up and then back down so they may be easily copied


use <../parallella/parallellaDesktop.scad>

include <../mo/mo.scad>

parallellaIndex( );

module parallellaIndex() {
  $name = true;

  moGridParts( [ 0, 0, 0], [ 0, 5 * in, 0 ], rotate = 0 ) {
    selectOther();
  }
}

module selectOther( ) {
  moGridParts( [ 0, 0, 0], [ 4 * in, 0, 0 ] ) {
    parallellaDesktop();
  }
}

