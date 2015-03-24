// All files referenced by the path up and then back down so they may be easily copied


use <../mocad/moLogo.scad>
use <../mocad/moShaft.scad>
use <../mocad/moPCB.scad>
use <../mocad/moGrid.scad>
use <../mocad/moSocketHeadCapScrew6_32.scad>
use <../mocad/moSnapFastener6.scad>
use <../mocad/moPipeline.scad>
use <../mocad/moBattery12V7AhLiFePO4.scad>

include <../mo/mo.scad>

moIndex( );

module moIndex() {
  $name = true;

  moGridParts( [ 0, 0, 0], [ 0, 5 * in, 0 ], rotate = 0 ) {
    selectFasteners();
    selectOther();
  }
}

module selectFasteners() {
  moGridParts( [ 0, 0, 0], [ 2 * in, 0, 0 ] ) {
    moSnapFastener6();
    moSocketHeadCapScrew6_32();
  }
}

module selectOther( ) {
  moGridParts( [ 0, 0, 0], [ 3 * in, 0, 0 ] ) {
    moPipeline( );
    moPipelinePoints();
    moGrid( info = true );
    moPCB( );
    moPCBPins(  );
    moPCBSIPMolding( );
    moPCBHoles(  );
    moPCBHoleGrid( );
    moBattery12V7AhLiFePO4();
  }
}