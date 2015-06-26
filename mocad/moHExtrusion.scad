include <../mo/mo.scad>

SectionPositionCount = 5;

module moHExtrusion( spec, p = [ 0, 0 ], info = false ) {
  color( Aluminum ) {
    moPitch( 3 ) {
      linear_extrude( height = spec[ 0 ] ) {   
        polygon( [ [ -spec[1]/2, -spec[3]/2 ], [ -spec[1]/2, -spec[2]/2 ], [ -spec[1]/2+spec[3], -spec[2]/2 ], [ -spec[1]/2+spec[3], -spec[3]/2 ], [ spec[1]/2-spec[3], -spec[3]/2 ], [ spec[1]/2-spec[3], -spec[2]/2 ],
                   [ spec[1]/2, -spec[2]/2 ],
                   [ spec[1]/2, -spec[3]/2 ], [ spec[1]/2,spec[2]/2 ], [ spec[1]/2-spec[3],spec[2]/2 ], [ spec[1]/2-spec[3],spec[3]/2 ], 
                   [ -spec[1]/2+spec[3],spec[3]/2 ], [ -spec[1]/2+spec[3],spec[2]/2 ], [-spec[1]/2,spec[2]/2 ] ] );       
      }
    }
  }
  
  if ( info ) {
    moPartOrigin();
    for ( i = [ 0 : spec[ 0 ] / spec[ 4 ] ] )
      for ( j = [ 0 : SectionPositionCount - 1 ] ) {
        pi = [ i, j ];
        moMoveTo( moHExtrusionPosition( pi, spec ) )
          moPosition2( pi );
      }
  }

  if ( $name )
    moPartLabel( parent_module( 1 ) );

}

function moHExtrusionPositionSection( s, w, h, t ) = ( s == 0 ) ? [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ] :
                                                            ( s == 1 ) ? [ [ w/2, 0, 0 ], [ 0, 0, 1 ], 90 ] :
                                                            ( s == 2 ) ? [ [ 0, 0, t/2 ], [ 1, 0, 0 ], -90 ] :
                                                            ( s == 3 ) ? [ [ -w/2, 0, 0 ], [ 0, 0, 1 ], -90 ] :
                                                                         [ [ 0, 0, -t/2 ], [ 1, 0, 0 ], 90 ];


function moHExtrusionPosition( p = [0, 0 ], spec ) = moMoveToPosition( [ [ 0, p[0]*spec[4], 0 ], [ 1, 0, 0 ], 0 ], moHExtrusionPositionSection( p[ 1 ], spec[ 1 ], spec[ 2 ], spec[ 3 ] ) ); 

demoSpec = [ 5 * in, 1 * in, 0.5 * in, 0.06 * in, 1 * in ];

moMoveOriginTo( moHExtrusionPosition( [0,0], demoSpec ) )
  moHExtrusion( demoSpec, [0,0], info = true, $name=true );


/*

include <../mo/mo.scad>


// Spec[ 0 ] = length
// Spec[ 1 ] = W
// Spec[ 2 ] = H
// Spec[ 3 ] = position spacing

// Pos[ 0 ] = section
// Pos[ 1 ] = position index

module moRectangularExtrusion( spec, p = [ 0, 0], info = false ) {
  color( Aluminum ) {
    moPitch( 3 ) {
      linear_extrude( height = spec[ 0 ] ) {
        square( [ spec[ 1 ], spec[ 2 ] ], center = true );
      }
    }
  }
  
  if ( info ) {
    moPartOrigin();
    for ( i = [ 0 : spec[ 0 ] / spec[ 3 ] ] )
      for ( j = [ 0 : SectionPositionCount - 1 ] ) {
        pi = [ i, j ];
        moMoveTo( moRectangularExtrusionPosition( pi, spec ) )
          moPosition2( pi );
      }
  }

  if ( $name )
    moPartLabel( parent_module( 1 ) );

}

function moRectangularExtrusionPositionSection( s, w, h ) = ( s == 0 ) ? [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ] :
                                                            ( s == 1 ) ? [ [ w/2, 0, 0 ], [ 0, 0, 1 ], 90 ] :
                                                            ( s == 2 ) ? [ [ 0, 0, h/2 ], [ 1, 0, 0 ], -90 ] :
                                                            ( s == 3 ) ? [ [ -w/2, 0, 0 ], [ 0, 0, 1 ], -90 ] :
                                                                         [ [ 0, 0, -h/2 ], [ 1, 0, 0 ], 90 ];


function moRectangularExtrusionPosition( p = [0, 0 ], spec ) = moMoveToPosition( [ [ 0, p[0]*spec[3], 0 ], [ 1, 0, 0 ], 0 ], moRectangularExtrusionPositionSection( p[ 1 ], spec[ 1 ], spec[ 2 ] ) ); 

demoSpec = [ 5 * in, 1 * in, 0.125 * in, 1 * in ];

moMoveOriginTo( moRectangularExtrusionPosition( [ 0, 0 ], demoSpec ) )
  moRectangularExtrusion( demoSpec, [ 0, 0 ], info = true, $name=true );


*/
