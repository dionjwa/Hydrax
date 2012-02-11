/*
 *                            _/                                                    _/   
 *       _/_/_/      _/_/    _/  _/    _/    _/_/_/    _/_/    _/_/_/      _/_/_/  _/    
 *      _/    _/  _/    _/  _/  _/    _/  _/    _/  _/    _/  _/    _/  _/    _/  _/     
 *     _/    _/  _/    _/  _/  _/    _/  _/    _/  _/    _/  _/    _/  _/    _/  _/      
 *    _/_/_/      _/_/    _/    _/_/_/    _/_/_/    _/_/    _/    _/    _/_/_/  _/       
 *   _/                            _/        _/                                          
 *  _/                        _/_/      _/_/                                             
 *                                                                                       
 * POLYGONAL - A HAXE LIBRARY FOR GAME DEVELOPERS
 * Copyright (c) 2009-2010 Michael Baczynski, http://www.polygonal.de
 *
 * Permission is hereby granted, free of charge, to any person obtaining
 * a copy of this software and associated documentation files (the
 * "Software"), to deal in the Software without restriction, including
 * without limitation the rights to use, copy, modify, merge, publish,
 * distribute, sublicense, and/or sell copies of the Software, and to
 * permit persons to whom the Software is furnished to do so, subject to
 * the following conditions:
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
 * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
 * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
 * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */
package de.polygonal.motor;

import de.polygonal.core.math.Mathematics;
import de.polygonal.core.math.Vec2;
import de.polygonal.motor.geom.primitive.AABB2;

/**
 * Tuning constants based on meters-kilograms-seconds (MKS) units.
 * Documentation mostly taken from Box2D.
 */
class Settings
{
	public function new()
	{
		setStepSize(1 / 60);
		
		eps                     = 1e-6;
		velocityIterations      = 8;
		positionIterations      = 2;
		doWarmStart             = true;
		computeStackLayer       = false;
		doSleep                 = true;
		doContinuousPhysics     = false;
		gravity                 = new Vec2(0, 9.81);
		relTolerance            = 0.95;
		absTolerance            = 0.001;
		lengthUnitsPerMeter     = 1;
		timeUnitsPerSecond      = 1;
		maxProxies              = 1 << 9;
		maxPairs                = maxProxies << 4;
		contactPoolSize         = 256;
		minAABBLineThickness    = 0.01 * lengthUnitsPerMeter;
		linSlop                 = 0.005 * lengthUnitsPerMeter;
		angSlop                 = 2 * Mathematics.DEG_RAD;
		toiSlop                 = 8 * linSlop;
		velThreshold            = 1. * lengthUnitsPerMeter / timeUnitsPerSecond;
		maxLinCorrection        = 0.2 * lengthUnitsPerMeter;
		maxAngCorrection        = 8 * Mathematics.DEG_RAD;
		maxLinVelocity          = 200 * lengthUnitsPerMeter / timeUnitsPerSecond;
		maxAngVelocity          = 250;
		contactBaumgarte        = 0.2;
		contactBaumgarteToi     = 0.75;
		timeToSleep             = 0.5 * timeUnitsPerSecond;
		linSleepTolerance       = 0.01 * (lengthUnitsPerMeter / timeUnitsPerSecond);
		angSleepTolerance       = (2.0 * Mathematics.DEG_RAD) / timeUnitsPerSecond;
		maxToiContactsPerIsland = 32;
		maxToiJointsPerIsland   = 32;
		maxStackLayerCount      = 32;
		quadTreeDepth           = 7;
		gridResolution          = 0.5;
		minGridResolution       = 2.0;
		maxGridResolution       = 0.30;
		gridFitnessRelTolerance = 1.05;
		doProfile               = false;
		profileIdBroadPhase     = 0;
		profileIdNarrowPhase    = 1;
		profileIdSolver         = 2;
		lazyPooling             = false;
	}
	
	/** The world bound. */
	public var worldBound:AABB2;
	
	/** Global absolute tolerance. Default=1e-6. */
	public var eps:Float;
	
	/** Time step. */
	public var dt:Float;
	
	/** dt * dtInv. */
	public var dtRatio:Float;
	
	/** Inverse time step (zero if dt eq. 0) */
	public var dtInv:Float;
	
	/** #velocity iterations to compute per step. */
	public var velocityIterations:Int;
	
	/** #position iterations to compute per step. */
	public var positionIterations:Int;
	
	/** If true, warm start the solver for improved coherence. */
	public var doWarmStart:Bool;
	
	/** Enable lazy (incremental) object pooling. Default is false. */
	public var lazyPooling:Bool;
	
	public var doContinuousPhysics:Bool;
	
	public var doProfile:Bool;
	public var profileIdBroadPhase:Int;
	public var profileIdNarrowPhase:Int;
	public var profileIdSolver:Int;
	
	public var computeStackLayer:Bool;
	
	public var doSleep:Bool;
	
	public var gravity:Vec2;
	
	/**
	 * Relative and absolute tolerance used in all SAT collision detection algorithms.
	 * Applies weightings to prever one MTD axis over another to help improve warm-starting and thus stability.
	 */
	public var relTolerance:Float;
	public var absTolerance:Float;
	
	/** MKS scaling factors. */
	public var lengthUnitsPerMeter:Float;
	public var timeUnitsPerSecond:Float;
	
	/** #proxies; must be a power of two. */
	public var maxProxies:Int;
	
	/** #pairs; must be a power of two. */
	public var maxPairs:Int;
	
	/** #cached contacts; 0=disabled. */
	public var contactPoolSize:Int;

	/** Minimum line thickness. Default=1 cm. */
	public var minAABBLineThickness:Float;
	
	/**
	 * A small length used as a collision and constraint tolerance.
	 * Usually it is chosen to be numerically significant, but visually insignificant.
	 * Default=0.5 cm.
	 */
	public var linSlop:Float;
	
	/**
	 * A small angle used as a collision and constraint tolerance.
	 * Usually it is chosen to be numerically significant, but visually insignificant.
	 * Default=2 degrees.
	 */
	public var angSlop:Float;
	
	/**
	 * Continuous collision detection (CCD) works with core, shrunken shapes.
	 * This is the amount by which shapes are automatically shrunk to work with CCD.
	 * This must be > linSlop
	 */
	public var toiSlop:Float;

	/**
	 * A velocity threshold for elastic collisions. Any collision with a relative
	 * linear velocity below this threshold will be treated as inelastic.
	 * Default=1 m/s.
	 */
	public var velThreshold:Float;
	
	/**
	 * The maximum linear position correction used when solving constraints.
	 * This helps to prevent overshoot. Default=20cm.
	 */
	public var maxLinCorrection:Float;
	
	/**
	 * The maximum angular position correction used when solving constraints.
	 * This helps to prevent overshoot. Default=8 degrees.
	 */
	public var maxAngCorrection:Float;
	
	/**
	 * The maximum linear velocity of a body. This limit is very large and is used
	 * to prevent numerical problems. You shouldn't need to adjust this.
	 */
	public var maxLinVelocity:Float;
	
	/**
	 * The maximum angular velocity of a body. This limit is very large and is used
	 * to prevent numerical problems. You shouldn't need to adjust this.
	 */
	public var maxAngVelocity:Float;
	
	/**
	 * This scale factor controls how fast overlap is resolved. Ideally this would be 1 so
	 * that overlap is removed in one time step. However using values close to 1 often lead
	 * to overshoot.
	 */
	public var contactBaumgarte:Float;
	public var contactBaumgarteToi:Float;
	
	/** The time that a body must be still before it will go to sleep. Default=0.5 seconds. */
	public var timeToSleep:Float;
	
	/** A body cannot sleep if its linear velocity is above this tolerance. Default=1 cm/s. */
	public var linSleepTolerance:Float;
	
	/** A body cannot sleep if its angular velocity is above this tolerance. Default=2 degrees. */
	public var angSleepTolerance:Float;
	
	/** Maximum #contacts to be handled to solve a TOI island. */
	public var maxToiContactsPerIsland:Int;

	/** Maximum #joints to be handled to solve a TOI island. */
	public var maxToiJointsPerIsland:Int;
	
	/** Maximum #stack layers. */
	public var maxStackLayerCount:Int;
	
	/** Friction mixing law. */
	public function mixFriction(friction1:Float, friction2:Float):Float { return 1 / Mathematics.invSqrt(friction1 * friction2); }

	/** Restitution mixing law. */
	public function mixRestitution(restitution1:Float, restitution2:Float):Float { return Mathematics.fmax(restitution1, restitution2); }
	
	/** Assigns a step size. */
	public function setStepSize(x:Float):Void
	{
		dt = x;
		dtInv = 1 / x;
		dtRatio = x * dtInv;
	}
	
	/** The total number of quad tree levels. Default=7. */
	public var quadTreeDepth:Int;
	
	/** Grid resolution for single-level gridding broad phase. Default=1.*/
	public var gridResolution:Float;
	
	
	public var minGridResolution:Float;
	public var maxGridResolution:Float;
	public var gridFitnessRelTolerance:Float;
}